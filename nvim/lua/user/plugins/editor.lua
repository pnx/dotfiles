return {
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
    -- Snippets
    {
        "L3MON4D3/LuaSnip",
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
