return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>ue", function() require("edgy").toggle() end, desc = "Edgy Toggle" },
		-- stylua: ignore
		{ "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
	},
	opts = {
		left = {
			{
				title = "Neo-Tree",
				ft = "neo-tree",
				filter = function(buf)
					return vim.b[buf].neo_tree_source == "filesystem"
				end,
				size = { height = 0.5 },
			},
			{
				title = "Test",
				ft = "neotest-summary"
			},
			"neo-tree",
		},
		options = {
			left = { size = 40 }
		},
		animate = {
			enabled = false,
		},
		exit_when_last = false
	}
}
