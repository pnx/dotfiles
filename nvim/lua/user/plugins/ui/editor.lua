local icons = require('user.icons')

return {
    -- indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            debounce = 10,
            indent = {
                char = icons.indent,
            },
            scope = {
                enabled = false,
            },
            exclude = {
                filetypes = {
                    "help",
                    "dashboard",
                },
            },
        },
        config = function(_, opts)
            require("ibl").setup(opts)

            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = false,
            keywords = {
                TODO = { color = "warning" },
            },
            highlight = {
                keyword = 'fg',
            }
        }
    },
    -- color highlight in documents
    {
        'brenoprata10/nvim-highlight-colors',
        opts = {
            render = 'virtual',
            virtual_symbol_position = 'eol',
            virtual_symbol_prefix = '',
            virtual_symbol_suffix = '',
        }
    },
}
