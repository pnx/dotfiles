return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			view = "cmdline"
		},
		presets = {
			bottom_search = true,
			command_palette = true
		}
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	}
}
