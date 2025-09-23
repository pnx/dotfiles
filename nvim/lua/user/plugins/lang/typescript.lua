local lspservers = {
    ts_ls = function()
        local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'

        local vue_plugin = {
            name = '@vue/typescript-plugin',
            location = vue_language_server_path,
            languages = { 'vue' },
            configNamespace = 'typescript',
        }
        return {
            init_options = {
                plugins = {
                    vue_plugin,
                },
            },
            filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
        }
    end,
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "typescript" }
        }
    },
    {
        "windwp/nvim-ts-autotag",
        optional = true,
        opts = {
            filetypes = {
                'javascript',
                'typescript',
                'tsx',
                'jsx'
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        },
    }
}
