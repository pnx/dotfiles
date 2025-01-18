return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "williamboman/mason.nvim",
            optional = true,
            dependencies = {
                { "williamboman/mason-lspconfig.nvim", config = function () end }
            }
        },
        {
            -- Autocomplete source
            "hrsh7th/nvim-cmp",
            optional = true,
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lsp-signature-help"
            },
        },
        -- Using blink.nvim atm.
        -- {
        --     "ray-x/lsp_signature.nvim",
        --     event = "VeryLazy",
        --     opts = {
        --         hint_enable = false,
        --         fix_pos = true,
        --         handler_opts = {
        --             border = "none"
        --         }
        --     },
        -- },
        -- LSP often return markdown that neovim parses.
        -- make sure we have a plugin that can render markdown to nicer text
        {
            'MeanderingProgrammer/render-markdown.nvim',
            dependencies = {
                'nvim-tree/nvim-web-devicons',
                {
                    "nvim-treesitter/nvim-treesitter",
                    opts = {
                        ensure_installed = { "markdown", "markdown_inline" }
                    }
                }
            },
            opts = {
                overrides = {
                    buftype = {
                        -- LSP Hover = "nofile"
                        nofile = {
                            code = { left_pad = 0, right_pad = 0 },
                        },
                    },
                },
            }
        }
    },
    --- @class LSPServerOptions : LSPFeatures
    --- @field server_capabilities? lsp.ServerCapabilities
    --- @field on_save function | nil

    --- @class LSPFeatures
    --- @field document_highlight? { enabled: boolean }
    --- @field codelens? { enabled: boolean }
    --- @field inlay_hints? { enabled: boolean, exclude?: table }

    --- @class LSPOptions
    opts = {
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
    },
    --- @param opts LSPOptions
    config = function(_, opts)
        local lspconfig = require("lspconfig")
        local utils = require("user.utils.lsp")
        local augroup = vim.api.nvim_create_augroup("Lsp", {})
        local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend('force',
            vim.lsp.protocol.make_client_capabilities() or {},
            has_cmp and cmp_lsp.default_capabilities() or {})

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

            lspconfig[server].setup(server_opts)
        end

        local have_mason, mlsp = pcall(require, "mason-lspconfig")

        local all_mslp_servers = {}
        if have_mason then
            all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
        end

        local ensure_installed = {} ---@type string[]
        for name, server_opts in pairs(opts.servers) do
            if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, name) then
                setup(name)
            else
                ensure_installed[#ensure_installed + 1] = name
            end
        end

        if have_mason then
            mlsp.setup({
                ensure_installed = ensure_installed,
                handlers = { setup },
            })
        end
    end,
}
