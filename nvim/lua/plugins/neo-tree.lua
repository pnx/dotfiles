return {
	'nvim-neo-tree/neo-tree.nvim',
	cmd = 'Neotree',
	keys = {
		{ '<leader>n', ':Neotree reveal toggle<CR>' },
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	opts = {
		close_if_last_window = true,
		hide_root_node = true,
		default_component_configs = {
			indent = {
			    indent_size = 2,
				padding = 1,
				-- indent guides
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "󰜌",
			},
			name = {
				use_git_status_colors = true,
			},
			git_status = {
				symbols = {
					-- Change type
					added     = "",
					modified  = "", 
					deleted   = "✖",
					renamed   = "󰁕",
					-- Status type
					untracked = "",
					ignored   = "",
					unstaged  = "",
					staged    = "",
					conflict  = "",
				}
			},
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
		},
	}
}