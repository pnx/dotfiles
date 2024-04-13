return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        debounce = 10,
        indent = {
            char = '▏',
        },
        scope = {
            enabled = true,
            show_start = false,
            show_end = false
        },
        exclude = {
            filetypes = {
                'help',
                'dashboard'
            }
        }
    },
    config = function(_, opts)
        require 'ibl'.setup(opts)

        local hooks = require 'ibl.hooks'
        hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
        hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    end
}
