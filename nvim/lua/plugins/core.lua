local keys = require("config.keymaps")

return {
	-- colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup(require("config.colorscheme"))
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = function()
			return {
				spec = keys.whichkey,
			}
		end,
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/playground",
		},
		opts = require("config.treesitter"),
		config = function(_, opts)
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					branch = "main",
					files = { "src/parser.c" },
					generate_requires_npm = true,
					requires_generate_from_grammar = true,
				},
				filetype = "blade",
			}

			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = require("config.autotag"),
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
				enabled = true,
				show_start = false,
				show_end = false,
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
		"echasnovski/mini.nvim",
		version = false,
	},
	-- Git stuff
	{
		"tpope/vim-fugitive",
		keys = keys.fugitive,
	},
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			{
				"folke/which-key.nvim",
				optional = true,
				opts = {
					defaults = {
						["<leader>g"] = { name = "+git" },
					},
				},
			},
		},
		lazy = false,
		keys = keys.gitsigns or {},
		opts = require("config.gitsigns"),
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"arkav/lualine-lsp-progress",
			"nvim-tree/nvim-web-devicons",
		},
		opts = require("config.lualine"),
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"sharkdp/fd",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		keys = keys.telescope,
		opts = require("config.telescope"),
		config = function(_, opts)
			local telescope = require("telescope")

			telescope.setup(opts)
			for name, _ in pairs(opts.extensions or {}) do
				telescope.load_extension(name)
			end
		end,
	},
	{
		"stevearc/conform.nvim",
		keys = keys.conform or {},
		opts = require("config.conform"),
		config = function(_, opts)
			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						---@diagnostic disable-next-line: undefined-field
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_fallback = true, range = range })
			end, { range = true })

			require("conform").setup(opts)
		end,
	},
	{
		"stevearc/oil.nvim",
		keys = keys.oil or {},
		opts = require("config.oil"),
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function(_, opts)
			require("oil").setup(opts)

			-- Don't touch my CWD!
			require("utils.oil").RegisterCWDHackHook()
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = keys.trouble or {},
		opts = {},
	},
	{
		"L3MON4D3/LuaSnip",
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
}
