local set = vim.opt


--
-- General Settings
--

set.termguicolors = true
set.updatetime = 50
set.showmode = false -- disable mode in the command line, because i use lualine


--
-- Editor settings
--


set.pumheight = 20
set.laststatus = 3
set.splitkeep = "screen"
set.scrolloff = 20

-- mouse and cursor
set.cursorline = true
set.mousemoveevent = true

-- search
set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- line numbers
set.number = true
set.relativenumber = true
set.numberwidth = 5

-- sign column to the right.
--set.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} %s  '

-- sign column to the left
set.statuscolumn = '%s %=%{v:relnum?v:relnum:v:lnum} '

-- indent
set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.autoindent = true
set.smartindent = true

-- Folding
--set.foldenable = true
--set.foldmethod = "expr"
--set.foldexpr = "nvim_treesitter#foldexpr()"

--vim.api.nvim_create_autocmd('BufReadPost,FileReadPost', {
--    pattern = '*',
--    cmd = 'normal zR',
--})
--

-- Completion
set.completeopt = "menuone,longest,preview"



--
-- Diagnostics
--


local icons = require('config.icons').diagnostics
vim.fn.sign_define('DiagnosticSignError', { text = icons.error, texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = icons.warn, texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = icons.info, texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = icons.hint, texthl = 'DiagnosticSignHint' })

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    underline = false,
    float = {
        -- border = 'single',
    },
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
    end,
})
