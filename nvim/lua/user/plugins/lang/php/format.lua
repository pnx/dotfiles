
return {
    require 'user.utils.mason'.ensure_installed({'pint', 'php-cs-fixer'}),
    {
        'stevearc/conform.nvim',
        optional = true,
        opts = {
            formatters_by_ft = {
                php = { 'php-cs-fixer', 'pint' },
                blade = { 'blade-formatter' }
            }
        }
    }
}
