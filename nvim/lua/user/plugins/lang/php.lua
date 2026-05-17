return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            install = { "php", "blade", "php_only", "phpdoc", "sql", "csv" },
            alias = { phpx = "php_only" }
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
    }
}
