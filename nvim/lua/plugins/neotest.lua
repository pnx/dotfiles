return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
		"olimorris/neotest-phpunit"
	},
	keys = {
		{"<leader>tn", ":lua require('neotest').run.run()<cr>", desc = "test nearest"},
		{"<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "test file"},
		{"<leader>ta", ":lua require('neotest').output_panel.open()<cr>:lua require('neotest').run.run({suite = true})<cr>", desc = "test all"},
		{"<leader>ts", ":lua require('neotest').run.stop()<cr>", desc = "stop test"},
		{"<leader>tq", ":lua require('neotest').output_panel.close()<cr>", desc = "close output window"},
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
				expanded = "╮",
				failed = icons.failed,
				final_child_indent = " ",
				final_child_prefix = "╰",
				non_collapsible = "─",
				passed = icons.ok,
				running = icons.running,
				skipped = icons.skipped,
				unknown = icons.unknown,
				watching = icons.watch
			}
		}
	end
}
