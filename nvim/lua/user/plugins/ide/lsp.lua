
--- @class LSPServerOptions : LSPFeatures
--- @field server_capabilities? lsp.ServerCapabilities
--- @field on_save function | nil
--- @field mason? boolean

--- @class LSPFeatures
--- @field document_highlight? { enabled: boolean }
--- @field codelens? { enabled: boolean }
--- @field inlay_hints? { enabled: boolean, exclude?: table }

--- @type LSPServerOptions
local defaultServerOpts = {
    server_capabilities = nil,
    on_save = nil,
    mason = true,
}

--- @class LSPOptions
local options = {
    --- @type LSPFeatures
    features = {
        document_highlight = {
            enabled = true,
        },
        codelens = {
            enabled = false,
        },
        inlay_hints = {
            enabled = true,
            exclude = {},
        },
    },
    --- @type { string: LSPServerOptions }
    servers = {},
}

--- @param opts LSPOptions
local config = function(_, opts)
    local utils = require("user.utils.lsp")
    local augroup = vim.api.nvim_create_augroup("Lsp", {})
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    --- @param server string
    local function setup(server)

        local server_opts = opts.servers[server] or {}

        if type(server_opts) == "function" then
            server_opts = server_opts()
        end

        -- Set missing features to default ones in server options.
        server_opts = vim.tbl_deep_extend("keep", server_opts, opts.features)

        ---@param client vim.lsp.Client
        ---@param bufnr number
        local on_attach = function(client, bufnr)
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

            -- Override any server capabilities.
            client.server_capabilities = vim.tbl_extend("force",
                client.server_capabilities,
                server_opts.server_capabilities or {})

            if server_opts.inlay_hints.enabled and client.supports_method("textDocument/inlayHint") then
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end

            if server_opts.codelens.enabled and client.supports_method("textDocument/codeLens") then
                utils.codelens(augroup, bufnr)
            end

            if server_opts.document_highlight.enabled and client.supports_method("textDocument/documentHighlight") then
                utils.document_highlight(bufnr)
            end

            -- Setup on save handler
            if server_opts.on_save then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = server_opts.on_save,
                })
            end
        end

        server_opts = vim.tbl_deep_extend("force", {
            on_attach = on_attach,
            capabilities = capabilities
        }, server_opts or {})

        vim.lsp.config(server, server_opts)
        vim.lsp.enable(server)
    end

    local have_mason, mlsp = pcall(require, "mason-lspconfig")

    local all_mslp_servers = {}
    if have_mason then
        -- Need to refresh the registry, otherwise mlsp does not find any servers.
        require("mason-registry").refresh()
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig").get_mappings().lspconfig_to_package)
    end

    local ensure_installed = {} ---@type string[]
    for name, server_opts in pairs(opts.servers) do
        setup(name)

        if type(server_opts) == "function" then
            server_opts = server_opts()
        end

        server_opts = vim.tbl_deep_extend("keep", server_opts, defaultServerOpts)
        if server_opts.mason == true and vim.tbl_contains(all_mslp_servers, name) then
            ensure_installed[#ensure_installed + 1] = name
        end
    end

    if have_mason then
        mlsp.setup({
            automatic_enable = false,
            ensure_installed = ensure_installed,
        })
    end
end

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "mason-org/mason.nvim",
            version = "^2.0.1",
            optional = true,
            dependencies = {
                { "mason-org/mason-lspconfig.nvim", version = "^2.1.0", config = function () end }
            }
        }
    },
    opts = options,
    config = config
}
