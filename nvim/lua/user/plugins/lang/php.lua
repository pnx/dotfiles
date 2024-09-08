local lspservers = {
    phpactor = {},
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "php", "php_only", "phpdoc", "blade" }
        }
    },
    {
        "windwp/nvim-ts-autotag",
        optional = true,
        opts = {
            filetypes = {
                'php',
                'blade',
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        ft = { "php" },
        opts = {
            servers = lspservers
        },
    },
    {
        "nvim-neotest/neotest",
        optional = true,
        ft = { "php" },
        dependencies = {
            "olimorris/neotest-phpunit",
            'V13Axel/neotest-pest',
        },
        opts = {
            adapters = {
                ["neotest-phpunit"] = {},
                ["neotest-pest"] = {},
            }
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
