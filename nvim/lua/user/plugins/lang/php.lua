local lspservers = {
    phpactor = {
        inlay_hints = {
            enabled = false
        }
    },
}

return {
    -- Include HTML because you prob always write some html with php :)
    { import = "user.plugins.lang.html" },
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
    -- Formatting
    {
        'stevearc/conform.nvim',
        optional = true,
        opts = {
            formatters_by_ft = {
                blade = { 'blade-formatter' },
            }
        }
    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        },
    },
    -- Testing
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
        version = "v2.2.2",
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
    }
}
