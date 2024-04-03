return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline"
		},
		presets = {
			bottom_search = true,
			command_palette = false
		},
		commands = {
			history = {
				view = "cmdline_output",
			}
		},
		views = {
			mini = {
				position = {
					row = -2,
				},
				border = {
					style = 'solid',
					padding = { 0, 1 },
				}
			}
		}
	},
}
