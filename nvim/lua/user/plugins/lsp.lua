return {
    "neovim/nvim-lspconfig",
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
            enabled = false,
        },
        inlay_hints = {
            enabled = false,
            exclude = {},
        },
        servers = {},
    },
    config = function(_, opts)
        local lspconfig = require("lspconfig")
        local augroup = vim.api.nvim_create_augroup("Lsp", {})

        for name, server_opts in pairs(opts.servers) do
            local on_attach = function(_, bufnr)
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

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
                on_attach = on_attach
            }, server_opts or {})

            lspconfig[name].setup(server_opts)
        end
    end,
}
