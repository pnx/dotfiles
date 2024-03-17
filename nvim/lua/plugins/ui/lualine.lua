local icons = require('config.icons')

return {
	'nvim-lualine/lualine.nvim',
	event = "VeryLazy",
	dependencies = {
		'arkav/lualine-lsp-progress',
		'nvim-tree/nvim-web-devicons',
	},
	opts = {
		options = {
			theme = "catppuccin-mocha",
			component_separators = '',
			globalstatus = true,
			disabled_filetypes = {
				statusline = {
					'dashboard',
					'TelescopePrompt'
				}
			}
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_x = {
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
					color = { fg = "#ff9e64" },
				},
				-- {
				-- 	"diff",
				-- 	symbols = {
				-- 		added = icons.diff.added .. ' ',
				-- 		modified = icons.diff.modified .. ' ',
				-- 		removed = icons.diff.removed .. ' '
				-- 	}
				-- },
				{
					"diagnostics",
					symbols = {
						error = icons.diagnostics.error .. ' ',
						warn = icons.diagnostics.warn .. ' ',
						info = icons.diagnostics.info .. ' ',
						hint = icons.diagnostics.hint .. ' ',
					},
				},
			},
			lualine_y = {
				'encoding',
				'fileformat',
				'filetype',
				'location'
			},
			lualine_z = {}
		},
		extensions = {
			'lazy',
			'neo-tree'
		}
	}
}
