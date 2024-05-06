return {
	'hrsh7th/nvim-cmp',
	version = false,
	event = "InsertEnter",
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-nvim-lsp',
		'L3MON4D3/LuaSnip',
		'onsails/lspkind-nvim',
	},
	opts = require('config.plugins.cmp'),
	config = function(_, opts)
		local cmp = require('cmp')

		cmp.setup(opts)

		-- insert () on function completion using autopairs
		cmp.event:on(
			'confirm_done',
			require('nvim-autopairs.completion.cmp').on_confirm_done()
		)
	end
}
