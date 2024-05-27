local icons = require("config.icons")

return function()
	local actions = require("telescope.actions")
	return {
		defaults = {
			border = {
				prompt = { 1, 1, 1, 1 },
				results = { 1, 1, 1, 1 },
				preview = { 1, 1, 1, 1 },
			},
			path_display = { truncate = 1 },
			prompt_prefix = " ",
			selection_caret = icons.current .. " ",
			multi_icon = icons.selected .. " ",
			file_ignore_patterns = {
				".git/",
				"node_modules/",
			},
			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
			},
		},
		pickers = {
			find_files = {
				hidden = true,
			},
			buffers = {
                theme = "dropdown",
                previewer = false,
				mappings = {
					i = {
						["<c-d>"] = actions.delete_buffer + actions.move_to_top,
					},
				},
			},
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
		},
	}
end
