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
