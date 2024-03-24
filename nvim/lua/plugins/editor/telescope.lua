local config = require('config.plugins.telescope')

return {
    'nvim-telescope/telescope.nvim',
	main = 'telescope',
    dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'sharkdp/fd',
		{
			"folke/which-key.nvim",
			optional = true,
			opts = {
				defaults = config.key_groups or {},
			},
		},
	},
	keys = config.keys or {},
	opts = config.opts or {},
	config = function (_, opts)
		local override = {
			border = {
				prompt = { 1, 1, 1, 1 },
				results = { 1, 1, 1, 1 },
				preview = { 1, 1, 1, 1 },
			},
			borderchars = {
				prompt = { "─", "│", "─", "│", "├", "┤", "┴", "└" },
				results = { "─", "│", " ", "│", "┌", "┬", "│", "│" },
				preview = { "─", "│", "─", " ", "─", "┐", "┘", "─" },
			},
		}

		opts.defaults = vim.tbl_deep_extend("force", opts.defaults, override)

		require('telescope').setup(opts)
	end
}
