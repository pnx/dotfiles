local lspservers = {
    gopls = {
        codelens = {
            enabled = true,
        },
        settings = {
            gopls = {
                analyses = {
                    unusedvariable = true,
                    unusedwrite = true,
                    useany = true,
                    fieldalignment = true
                },
                gofumpt = true,
                hoverKind = 'SynopsisDocumentation',
                codelenses = {
                    gc_details = false,
                    generate = true,
                    regenerate_cgo = true,
                    run_govulncheck = true,
                    test = true,
                    tidy = true,
                    upgrade_dependency = true,
                    vendor = true,
                },
                hints = {
                    parameterNames = true
                },
                completeUnimported = true,
                semanticTokens = true
            },
        },
        on_save = function()
            local params = vim.lsp.util.make_range_params()
            params.context = { only = { "source.organizeImports" } }
            local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
            for cid, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                    if r.edit then
                        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                        vim.lsp.util.apply_workspace_edit(r.edit, enc)
                    end
                end
            end
            vim.lsp.buf.format({ async = false })
        end,
    },
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "go", "gomod", "gowork", "gosum" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        ft = { "go" },
        opts = {
            servers = lspservers
        },
    },
    {
        "nvim-neotest/neotest",
        optional = true,
        ft = { "go" },
        dependencies = {
            "nvim-neotest/neotest-go",
        },
        opts = {
            adapters = {
                ["neotest-go"] = {}
            }
        }
    },
}
