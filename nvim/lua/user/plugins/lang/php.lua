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
    },
    -- mago - static analyzer, linter, and formatter.
    {
        'calvinludwig/mago.nvim',
        ft = 'php',
        opts = {
            logging = {
                notify = false,
                write_to_log = false,
                min_level = 'INFO',
                log_file = nil,
            },
        },
    }
}
