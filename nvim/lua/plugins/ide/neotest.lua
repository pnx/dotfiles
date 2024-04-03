return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
		"olimorris/neotest-phpunit",
		{
			"folke/which-key.nvim",
			optional = true,
			opts = {
				defaults = {
					["<leader>t"] = { name = "+test" },
				},
			},
		},
	},
	keys = {
		{"<leader>tn", ":lua require('neotest').run.run()<cr>", desc = "test nearest", silent = true},
		{"<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "test file"},
		{"<leader>ta", ":lua require('neotest').output_panel.open()<cr>:lua require('neotest').run.run({suite = true})<cr>", desc = "test all"},
		{"<leader>ts", ":lua require('neotest').run.stop()<cr>", desc = "stop test"},
		{"<leader>tq", ":lua require('neotest').output_panel.close()<cr>", desc = "close output window"},
		{"<leader>te", ":Neotest summary<cr>", desc = "Open test explorer"}
	},
	opts = function()
		local icons = require('config.icons').test

		return {
			adapters = {
				require("neotest-go")({
					recursive_run = true
				}),
				require("neotest-phpunit")
			},
			icons = {
				child_indent = "│",
				child_prefix = "├",
				collapsed = "─",
				expanded = "┐",
				failed = icons.failed,
				final_child_indent = " ",
				final_child_prefix = "└",
				non_collapsible = "─",
				passed = icons.ok,
				running = icons.running,
				skipped = icons.skipped,
				unknown = icons.unknown,
				watching = icons.watch
			},
			summery = {
				open = "botleft vsplit"
			}
		}
	end
}
