return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
        { 'folke/neodev.nvim', opts = {} },
    },
    opts = require('config.plugins.lsp'),
    config = function(_, opts)
        -- Setup Mason to automatically install LSP servers
        require('mason').setup()
        require('mason-lspconfig').setup({ automatic_installation = true })
        local augroup = vim.api.nvim_create_augroup("Lsp", {})
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = false

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover,
            { border = 'single' }
        )

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            focusable = true,
            style = "minimal",
            border = "single",
        })

         vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false,
            }
        )

        for name, server_opt in pairs(opts.servers) do
            local on_attach = function(client, bufnr)
                for bind, settings in pairs(opts.mappings) do
                    vim.keymap.set('n', bind, settings[1], vim.tbl_deep_extend("force", settings[2], { buffer = bufnr }))
                end

                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

                -- Add format on save if configured and client supports it.
                if server_opt.format_on_save and client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end

                if server_opt.on_save then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = server_opt.on_save,
                    })
                end


                if client.supports_method("textDocument/documentHighlight") then
                    vim.api.nvim_create_autocmd("CursorHold", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function() vim.lsp.buf.document_highlight() end
                    })

                    vim.api.nvim_create_autocmd("CursorHoldI", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function() vim.lsp.buf.document_highlight() end
                    })

                    vim.api.nvim_create_autocmd("CursorMoved", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function() vim.lsp.buf.clear_references() end
                    })
                end
            end

            lspconfig[name].setup({
                settings = server_opt.settings or {},
                capabilities = capabilities,
                on_attach = on_attach
            })
        end
    end
}
