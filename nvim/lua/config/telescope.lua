return {
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
}

