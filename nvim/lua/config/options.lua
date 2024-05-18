local set = vim.opt
local icons = require('config.icons')

--
-- Variables
--


-- Custom
vim.g.float_border = 'single'


--
-- General Settings
--

set.termguicolors = true

-- Decrease update time
set.updatetime = 50

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
set.timeoutlen = 50

-- disable mode in the command line, because i use lualine
set.showmode = false


--
-- Editor settings
--

set.wrap = false -- Disable line wrap
set.pumheight = 20
set.laststatus = 3
set.splitkeep = "screen"
set.scrolloff = 10

-- Configure how new splits should be opened
set.splitright = true
set.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
set.list = false
set.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

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
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
set.ignorecase = true
set.smartcase = true

-- Spell stuff, because i cant english
set.spell = true
set.spelllang = { 'en_us' }

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

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    underline = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
            [vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
            [vim.diagnostic.severity.INFO] = icons.diagnostics.info,
            [vim.diagnostic.severity.HINT] = icons.diagnostics.hint
        },
    },
    float = {
        border = vim.g.float_border,
    }
})

