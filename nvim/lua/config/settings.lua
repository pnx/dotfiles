--
-- General Settings
--

vim.opt.showmode = false -- disable mode in the command line, because i use lualine

--
-- Editor settings
--

vim.opt.scrolloff=20
--vim.opt.sidescrolloff = 8
vim.opt.cursorline = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 5
vim.opt.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} %s '

-- indent
vim.opt.smartindent = true

-- Filetypes
vim.filetype.add({
	pattern = {
		['.*%.blade%.php'] = 'blade',
	},
})

