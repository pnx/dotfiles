local icons = require('config.icons')

return {
    'nvim-telescope/telescope.nvim',
	main = 'telescope',
    dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'sharkdp/fd',
		{
			"folke/which-key.nvim",
			-- optional = true,
			opts = {
				defaults = {
					["<leader>s"] = { name = "+search" },
				},
			},
		},
	},
	keys = require('config.telescope'),
	opts = function()
		local actions = require("telescope.actions")
		return {
			defaults = {
				path_display = { truncate = 1 },
				-- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				border = {
					prompt = { 1, 1, 1, 1 },
					results = { 1, 1, 1, 1 },
					preview = { 1, 1, 1, 1 },
				},
				borderchars = {
					prompt = { "─", "│", "─", "│", "├", "┤", "┴", "└" },
					results = { "─", "│", " ", "│", "┌", "┬", "│", "│" },
					preview = { "─", "│", "─", " ", "─", "┐", "┘", "─" },
				},
				prompt_prefix = ' ' .. icons.prompt .. ' ',
				selection_caret = icons.current .. ' ',
				multi_icon = icons.selected .. ' ',
				file_ignore_patterns = {
					".git/",
					"node_modules/"
				},
				mappings = {
					i = {
						["<esc>"] = actions.close
					}
				}
			},
			pickers = {
				find_files = {
					hidden = true
				}
			}
		}
	end,
}
