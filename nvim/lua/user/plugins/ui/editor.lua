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
                -- TODO = { color = "warning" },
            },
            colors = {
                default = { "TodoCommentsDefault", "#7C3AED" },
                error = { "TodoCommentsError", "#DC2626" },
                warning = { "TodoCommentsWarning", "#FBBF24" },
                info = { "TodoCommentsInfo", "#2563EB" },
                hint = { "TodoCommentsHint", "#10B981" },
                test = { "TodoCommentsTest", "#FF00FF" }
            },
            highlight = {
                keyword = 'fg',
            }
        }
    },
    -- color highlight in documents
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            options = {
                parsers = {
                    hex = { enable = true },
                    rgb = { enable = true },
                    hsl = { enable = true },
                    oklch = { enable = true },
                    xterm = { enable = true },
                    tailwind = {
                        lsp = true,
                    },
                },
                display = {
                    mode = "virtualtext",
                },
            }
        },
    }
}
