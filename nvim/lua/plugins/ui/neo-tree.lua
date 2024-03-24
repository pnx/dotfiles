local icons = require('config.icons')

return {
	'nvim-neo-tree/neo-tree.nvim',
	cmd = 'Neotree',
	keys = {
		{ '<leader>fe', ':Neotree reveal toggle<CR>', desc = 'Toggle File Explorer'},
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
				folder_open = icons.folder.open,
				folder_close = icons.folder.close,
				folder_empty = icons.folder.empty,
			},
			name = {
				use_git_status_colors = false,
			},
			git_status = {
				symbols = icons.gitsigns
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
				enable = true
			},
		},
	}
}
