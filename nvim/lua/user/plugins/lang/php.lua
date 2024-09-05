local lspservers = {
    phpactor = {
        settings = {
            init_options = {
                ["language_server_phpstan.enabled"] = true,
                ["language_server_psalm.enabled"] = false,
            },
        },
    },
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "php", "phpdoc" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        },
    },
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "tpope/vim-dotenv",
            "MunifTanjim/nui.nvim",
            "nvimtools/none-ls.nvim",
        },
        ft = { "php" },
        cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
        opts = {
            features = {
                null_ls = {
                    enable = true,
                },
                route_info = {
                    enable = true,
                    position = 'right',
                    middlewares = true,
                    method = true,
                    uri = true
                },
            },
        },
        config = true,
    }
}
