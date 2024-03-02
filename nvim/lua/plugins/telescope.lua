return {
    'nvim-telescope/telescope.nvim', 
	tag = '0.1.4',
    dependencies = { 
		'nvim-lua/plenary.nvim',
		'kyazdani42/nvim-web-devicons'
	},
	keys = require('config.telescope'),
	config = function()
		require('telescope').setup({
			defaults = {
				path_display = { truncate = 1 },
				prompt_prefix = ' ',
				selection_caret = '  ',
				file_ignore_patterns = { 
					".git/",
					"node_modules/" 
				},
			},
			pickers = {
				find_files = {
					hidden = true
				},
			},
		})
	end
}
