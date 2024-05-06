local icons = require('config.icons')

return {
	close_if_last_window = false,
	hide_root_node = true,
	default_component_configs = {
		indent = {
			indent_size = 2,
			padding = 1,
			-- indent guides
			with_markers = true,
			indent_marker = icons.tree.node,
			last_indent_marker = icons.tree.nodelast,
		},
		icon = {
			folder_open = icons.folder.open,
			folder_close = icons.folder.close,
			folder_empty = icons.folder.empty,
			default = icons.files.text,
		},
		name = {
			use_git_status_colors = false,
		},
		git_status = {
			symbols = icons.gitsigns
		},
		file_size = {
			enabled = false,
		},
		type = {
			enabled = false,
		},
		last_modified = {
			enabled = false,
		},
		created = {
			enabled = false,
		},
		symlink_target = {
			enabled = true,
		},
	},
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function()
				if vim.bo.filetype == "neo-tree" then
					vim.cmd("setlocal statuscolumn=")
				end
			end,
		}
	},
	filesystem = {
		filtered_items = {
			visible = true, -- when true, they will just be displayed differently than normal items
			hide_dotfiles = true,
			hide_gitignored = true,
			hide_hidden = true, -- only works on Windows for hidden files/directories
			hide_by_name = {
				"node_modules",
				"vendor",
			},
		},
		follow_current_file = {
			enabled = true,
		},
		use_libuv_file_watcher = true,
	}
}
