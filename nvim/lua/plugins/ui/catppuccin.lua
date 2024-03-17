return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = require('config.catppuccin'),
	config = function (_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end
}
