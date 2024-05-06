return {
	'nvim-neo-tree/neo-tree.nvim',
	cmd = 'Neotree',
	keys = {
		{ '<leader>Fe', ':Neotree reveal toggle<CR>', desc = 'Toggle File Explorer'},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	opts = require('config.plugins.neo-tree')
}
