local set = vim.opt

-- General Settings
--

set.termguicolors = true
set.updatetime = 50
set.showmode = false -- disable mode in the command line, because i use lualine

--
-- Editor settings
--
set.pumheight = 20
set.hlsearch = false
set.incsearch = true
set.laststatus = 3
set.scrolloff=20
--vim.opt.sidescrolloff = 8
set.cursorline = true

-- line numbers
set.number = true
set.relativenumber = true
set.numberwidth = 5
set.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} %s '

-- indent
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.autoindent = true
set.smartindent = true

-- Filetypes
vim.filetype.add({
	pattern = {
		['.*%.blade%.php'] = 'blade',
	},
})

-- Sign configuration
local icons = require('config.icons').diagnostics
vim.fn.sign_define('DiagnosticSignError', { text = icons.error, texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = icons.warn, texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = icons.info, texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = icons.hint, texthl = 'DiagnosticSignHint' })

