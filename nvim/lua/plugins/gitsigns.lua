return {
	'lewis6991/gitsigns.nvim',
	lazy = false,
	keys = {
		{ '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', desc = 'Git preview diff' },
		{ '<leader>gb', '<cmd>Gitsigns blame_line<cr>', desc = 'Git blame' }
	},
	opts = {
		signs = {
			add = { text = '▌' },
			delete = { text = '' },
			change = { text = '▌' },
			untracked = { text = '+'}
		},
	},
}
