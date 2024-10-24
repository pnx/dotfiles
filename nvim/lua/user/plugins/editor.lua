return {
    { import = "user.plugins.editor.treesitter" },
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
    "echasnovski/mini.bufremove",
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            debounce = 10,
            indent = {
                char = "▏",
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
    -- { import = "user.plugins.editor.ufo" },
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
                    { text = { " " } },
                    {
                        click = "v:lua.ScSa",
                        sign = {
                            name = { ".*" },
                            namespace = { ".*" },
                            maxwidth = 1,
                        },
                    },
                    {
                        text = { builtin.lnumfunc, " " },
                        click = "v:lua.ScLa",
                    },
                    {
                        click = "v:lua.ScSa",
                        sign = {
                            namespace = { "gitsigns" },
                            maxwidth = 1,
                            colwidth = 1,
                        }
                    },
                    -- { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
                    { text = { "│ " } },
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
            user.formatter = ":lua require'conform'.format({ async = true })<CR>:<DEL>"
        end
    },
    { import = "user.plugins.editor.fuzzyfinder" },
    { import = "user.plugins.editor.autocomplete" },
    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        lazy = true,
        dependencies = {
            {
                "rafamadriz/friendly-snippets",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },
            {
                "hrsh7th/nvim-cmp",
                optional = true,
                dependencies = {
                    "saadparwaiz1/cmp_luasnip"
                },
                opts = {
                    snippet = {
                        expand = function(args)
                            require("luasnip").lsp_expand(args.body)
                        end,
                    }
                }
            }
        },
        opts = {},
        config = function(_, opts)
            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
            require("luasnip").setup(opts)
        end,
    },
}
