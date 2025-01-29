local icons = require('user.icons')

return {
    { import = "user.plugins.editor.treesitter" },
    { 'echasnovski/mini.pairs', version = '*', opts = {}},
    { 'echasnovski/mini.ai', version = '*', opts = {}},
    { 'echasnovski/mini.surround', version = '*', opts ={}},
    {
        "mbbill/undotree",
        event = { "BufReadPre", "BufNewFile" },
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
    {
        "pnx/mini.bufremove",
        opts = {
            empty_buf = "Alpha"
        },
    },
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
    -- Better folds
    { import = "user.plugins.editor.ufo" },
    -- Better status column
    {
        "luukvbaal/statuscol.nvim",
        event = { "BufReadPre", "BufNewFile", "BufAdd" },
        opts = function()
            local builtin = require("statuscol.builtin")
            return {
                -- Align current relative number to the right.
                relculright = true,
                ft_ignore = {
                    'help',
                    'alpha'
                },
                segments = {
                    {
                        click = "v:lua.ScSa",
                        sign = {
                            namespace = { "gitsigns" },
                            maxwidth = 1,
                            colwidth = 1,
                            foldclosed = true,
                        }
                    },
                    {
                        click = "v:lua.ScSa",
                        sign = {
                            name = { ".*" },
                            namespace = { ".*" },
                            maxwidth = 1,
                            foldclosed = true,
                        },
                    },
                    {
                        text = { " ", builtin.lnumfunc, " " },
                        click = "v:lua.ScLa",
                    },
                    {
                        text = { builtin.foldfunc, " " },
                        condition = { true, function (args) return args.fold.width > 0 end },
                        click = "v:lua.ScFa"
                    },
                    {
                        text = {
                            function(args)
                                local pos = vim.api.nvim_win_get_cursor(args.win)
                                return (args.lnum == pos[1] and "%#SignColumnSep#" or "")..icons.signcolum.separator
                            end,
                        },
                    },
                }
            }
        end,
    },
    { import = "user.plugins.editor.gitsigns" },
    -- Formatting
    {
        'stevearc/conform.nvim',
        opts = {
            default_format_opts = {
                lsp_format = "fallback"
            }
        },
        init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
            user.formatter = function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = {
                        start = { args.line1, 0 },
                        ["end"] = { args.line2, end_line:len() },
                    }
                end
                require("conform").format({ async = true, range = range })
            end
        end
    },
    { import = "user.plugins.editor.finder" },
    { import = "user.plugins.editor.autocomplete" },
    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        lazy = true,
        build = "make install_jsregexp",
        dependencies = {
            {
                "rafamadriz/friendly-snippets",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },
        },
        opts = {},
        config = function(_, opts)
            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
            require("luasnip").setup(opts)
        end,
    },
    -- {
    --     "m4xshen/hardtime.nvim",
    --     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    --     opts = {}
    -- },
}
