local set = vim.opt
local icons = require('config.icons')

--
-- General Settings
--

set.termguicolors = true
set.updatetime = 50
set.showmode = false -- disable mode in the command line, because i use lualine


--
-- Editor settings
--

set.wrap = false -- Disable line wrap
set.pumheight = 20
set.laststatus = 3
set.splitkeep = "screen"
set.scrolloff = 20

set.fillchars = {
    foldopen = icons.fold.open,
    foldclose = icons.fold.close,
    fold = " ",
    foldsep = icons.fold.sep,
    diff = " ",
    eob = " ",
}

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

-- sign column to the left
set.statuscolumn = '%s %=%{v:relnum?v:relnum:v:lnum} │ '

-- indent
set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.autoindent = true
set.smartindent = true

-- Completion
-- set.completeopt = "menuone,longest,preview"

-- folds
set.foldenable = true
set.foldlevel = 99
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldcolumn = "auto"

--
-- Diagnostics
--



vim.fn.sign_define('DiagnosticSignError', { text = icons.diagnostics.error, texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = icons.diagnostics.warn, texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = icons.diagnostics.info, texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = icons.diagnostics.hint, texthl = 'DiagnosticSignHint' })

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
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 400 }
    end,
})
