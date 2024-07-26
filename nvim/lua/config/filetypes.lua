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

-- PHP
autocmd('Filetype', {
    pattern = 'php',
    callback = function()
        -- Fix autocomment plugins to use line comments
        vim.cmd('setlocal commentstring=//\\%s')

        -- Goto file for blade files in laravel projects
        vim.cmd([[
            set path=.,resources/views
            set suffixesadd=.blade.php
            set includeexpr=substitute(v:fname,'\\.','/','g')
        ]])
    end
})

autocmd('Filetype', {
    pattern = 'kdl',
    callback = function()
        vim.cmd('setlocal commentstring=//\\%s')
    end
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

-- Softtab (4) for CSS types
autocmd('Filetype', {
    group = 'indent',
    pattern = { 'css', 'scss', 'less' },
    command = 'setlocal ts=4 sts=4 sw=4 expandtab'
})

-- Hardtabs for c/cpp
autocmd('Filetype', {
    group = 'indent',
    pattern = { 'c', 'cpp' },
    command = 'setlocal ts=8 sts=0 sw=8 noexpandtab'
})
