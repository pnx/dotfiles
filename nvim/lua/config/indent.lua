local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local set = vim.opt

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.autoindent = true

augroup('indent', { clear = true })

-- Hardtabs for make
autocmd('Filetype', {
	group = 'indent',
	pattern = { 'make' },
	command = 'setlocal ts=4 sts=0 sw=4 noexpandtab'
})

-- Softtab (2) for yaml
autocmd('Filetype', {
	group = 'indent',
	pattern = { 'yaml' },
	command = 'setlocal ts=2 sts=2 sw=2 expandtab'
})

-- Hardtabs for c/cpp
autocmd('Filetype', {
	group = 'indent',
	pattern = { 'c', 'cpp' },
	command = 'setlocal ts=8 sts=0 sw=8 noexpandtab'
})
