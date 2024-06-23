return function()
	local icons = require("config.icons")
	local actions = require("telescope.actions")

	local dropdown_opts = {
		previewer = false,
		prompt_title = false,
		layout_strategy = "horizontal",
		layout_config = {
			prompt_position = "top",
		},
	}
	return {
		defaults = {
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
			buffers = vim.tbl_deep_extend("force", dropdown_opts, {
				theme = "dropdown",
				mappings = {
					i = {
						["<c-d>"] = actions.delete_buffer + actions.move_to_top,
					},
				},
			}),
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown(dropdown_opts),
			},
		},
	}
end
