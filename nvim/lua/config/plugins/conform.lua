return {
	keys = {
		{ '<leader>ff', "<cmd>Format<cr>", desc = 'Format file' },
		{ '<leader>ff', "<cmd>Format<cr>", mode = 'x', desc = 'Format selection' },
	},
	opts = {
		format_options = {
			async = true,
			lsp_fallback = true,
		},
		notify_on_error = true,
		formatters_by_ft = {
			blade = { "blade-formatter" },
			lua = { "stylua" },
			["_"] = { "prettier" }
		}
	}
}
