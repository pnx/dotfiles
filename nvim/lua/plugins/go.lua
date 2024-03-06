return {
	"ray-x/go.nvim",
	main = "go",
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function(opts)
		require('go').setup(opts)
	end,
	event = {"CmdlineEnter"},
	ft = {"go", 'gomod'},
	build = ':lua require("go.install").update_all_sync()'
}
