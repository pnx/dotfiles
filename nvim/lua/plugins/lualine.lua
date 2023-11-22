return {
	'nvim-lualine/lualine.nvim',
	event = "VeryLazy",
	dependencies = {
		'arkav/lualine-lsp-progress',
		'kyazdani42/nvim-web-devicons',
	},
	opts = {
		options = {
			component_separators = '',
			globalstatus = true,
		},
		sections = {
			lualine_x = {
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
					color = { fg = "#ff9e64" },
				}
			},
			lualine_y = {
				'encoding', 'fileformat', 'filetype'
			}
		},
	}
}
