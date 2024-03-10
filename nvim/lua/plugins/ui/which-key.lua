return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		defaults = {
			mode = { "n", "v" },
			["<leader>r"] = { name = "+rename" },
			["<leader>b"] = { name = "+buffers" },
			["<leader>f"] = { name = "+files" },
		}
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end
}

