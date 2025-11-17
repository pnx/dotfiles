return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "php", "php_only", "phpdoc", "sql", "csv" }
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
        'ccaglak/phptools.nvim',
        opts = {
            ui = {
                fzf = true
            },
        }
    }
}
