local lspservers = {
    gopls = {
        settings = {
            gopls = {
                analyses = {
                    unusedvariable = true,
                    unusedwrite = true,
                    useany = true,
                },
                gofumpt = true,
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
    }
}
