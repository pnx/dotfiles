return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = true,
			keymap = {
				accept = "<C-F>",
			},
		},
		panel = {
			enabled = true,
			auto_refresh = true,
		},
	}
}
