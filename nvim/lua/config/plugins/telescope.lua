local icons = require('config.icons')

return {
	key_groups = {
		["<leader>s"] = { name = "+search" },
	},
	keys = {
		{ '<leader>sf', '<cmd>Telescope find_files<cr>', desc = 'Search files' },
		{ '<leader>sa', '<cmd>Telescope live_grep<cr>', desc = 'Search in files' },
		{ '<leader>sg', '<cmd>Telescope git_files<cr>', desc = 'Search Git files' },
		{ '<leader>so', '<cmd>Telescope oldfiles<cr>', desc = 'Search Old files' },
		{ '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = 'Search for word under cursor' },
		-- LSP
		{ '<leader>sr', '<cmd>Telescope lsp_references<cr>', desc = 'Search Reference' },
		{ '<leader>ss', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Search document symbols' },
		{ '<leader>sr', '<cmd>Telescope lsp_references<cr>', desc = 'Search Reference' },
		{ 'gd', '<cmd>Telescope lsp_definitions<cr>', desc = 'Goto definition' },
	},
	opts = function()
		local actions = require("telescope.actions")
		return {
			defaults = {
				path_display = { truncate = 1 },
				prompt_prefix = ' ',
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

