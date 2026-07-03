local spec = require('user.utils.lang_spec')

return {
    spec.treesitter("php", "blade", "php_only", "phpdoc", "sql", "csv"),
    spec.treesitter_alias({ phpx = "php_only" }),
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
