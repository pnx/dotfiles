local icons = require('config.icons')

return {
	'romgrk/barbar.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	init = function() vim.g.barbar_auto_setup = false end,
	opts = {
		animation = false,
		auto_hide = 0,
		focus_on_close = 'previous',
		button = icons.close,
		highlight_inactive_file_icons = true,
		icons = {
			separator = {left = '', right = ''},
			separator_at_end = false,
			inactive = { button = '', separator = { left = '', right = ''} },
			modified = {button = icons.gitsigns.modified },
			pinned = {button = icons.pinned, filename = true},
			gitsigns = {
				added = { enabled = false },
				changed = { enabled = false },
				deleted = { enabled = false },
			}
		},
		maximum_padding = 2,
		minimum_padding = 1,
		sidebar_filetypes = {
			['neo-tree'] = {event = 'BufWipeout'},
		}
	},
}
