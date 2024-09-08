return {
    "neovim/nvim-lspconfig",
    -- event = "InsertEnter",
    lazy = true,
    dependencies = {
        {
            -- Autocomplete source
            "hrsh7th/nvim-cmp",
            optional = true,
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lsp-signature-help"
            },
        },
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
    opts = {
        document_highlight = {
            enabled = true,
        },
        codelens = {
            enabled = true,
        },
        inlay_hints = {
            enabled = true,
            exclude = {},
        },
        servers = {},
    },
    config = function(_, opts)
        local lspconfig = require("lspconfig")
        local utils = require("user.utils.lsp")
        local augroup = vim.api.nvim_create_augroup("Lsp", {})
        local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend('force',
            vim.lsp.protocol.make_client_capabilities() or {},
            has_cmp and cmp_lsp.default_capabilities() or {})

        for name, server_opts in pairs(opts.servers) do
            ---@param client vim.lsp.Client
            ---@param bufnr number
            local on_attach = function(client, bufnr)
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

                if (opts.inlay_hints.enabled or false) and client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end

                if opts.codelens.enabled and client.server_capabilities.codeLensProvider then
                    utils.codelens(augroup, bufnr)
                end

                if opts.document_highlight.enabled and client.server_capabilities.documentHighlightProvider then
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

            lspconfig[name].setup(server_opts)
        end
    end,
}
