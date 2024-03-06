return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		local wk = require("which-key")

		wk.register({
			f = 'file',
			b = 'buffers',
			t = 'test',
			g = 'git',
			s = 'search'
		}, { prefix = "<leader>" })
	end
}

