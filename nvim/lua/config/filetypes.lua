--
-- Filetype settings
--
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup


-- Add blade filetype for .blade.php files
vim.filetype.add({
    pattern = {
        ['.*%.blade%.php'] = 'blade',
    },
})

-- Fix autocomment plugins to use line comments for php.
autocmd('Filetype', {
    pattern = 'php',
    command = 'setlocal commentstring=//\\%s'
})


--
-- Indent
--


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
