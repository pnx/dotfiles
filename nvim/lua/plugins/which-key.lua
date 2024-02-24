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
			f = {
				name = "file", -- optional group name
				f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
				n = { "New File" }, -- just a label. don't create any mapping
				e = "Edit File" -- same as above
			},
		}, { prefix = "<leader>" })
	end
}

