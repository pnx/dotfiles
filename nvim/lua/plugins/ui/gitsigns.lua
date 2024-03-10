local icons = require('config.icons').diff_gutter

return {
	'lewis6991/gitsigns.nvim',
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
	keys = {
		{ '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', desc = 'Git preview diff' },
		{ '<leader>gb', '<cmd>Gitsigns blame_line<cr>', desc = 'Git blame' }
	},
	opts = {
		signs = {
			add			 = { text = icons.add },
			delete		 = { text = icons.delete },
			change		 = { text = icons.change },
			untracked    = { text = icons.untracked },
			topdelete    = { text = icons.delete },
			changedelete = { text = icons.change },
		},
	},
}
