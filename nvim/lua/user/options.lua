-------------------------------------------------------
-- Helper imports
-------------------------------------------------------

local icons = require("user.icons")


-------------------------------------------------------
-- General options
-------------------------------------------------------

-- Decrease update time
vim.o.updatetime = 50

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.o.timeoutlen = 50

vim.o.mouse = "a"
vim.o.confirm = true

-------------------------------------------------------
-- User interface
-------------------------------------------------------

vim.o.winblend = 10   -- how much floating windows should blend with background.
vim.o.pumblend = 10   -- popup blend
vim.o.pumheight = 15 -- popup height

-- Configure how new splits should be opened
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.shortmess = "atIF"

-------------------------------------------------------
-- Editor
-------------------------------------------------------

vim.o.fileformats = "unix,dos"

vim.o.wrap = false -- Disable line wrap
vim.o.cursorline = true
vim.o.scrolloff = 10

-- indent
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.smartindent = true

-- line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 1

-- Gutter format
vim.o.statuscolumn = '%s %=%{v:relnum?v:relnum:v:lnum} %C│ '

-- search
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Folds
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldcolumn = "auto"

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = false
vim.o.listchars = [[tab:  󰄾,space:·,eol:␍,nbsp:␣]]

vim.o.fillchars = string.format([[eob: ,fold: ,foldopen:%s,foldsep:%s,foldclose:%s]],
    icons.fold.open, icons.fold.sep, icons.fold.close)

-- Spell stuff, because i cant English
vim.o.spell = true
vim.o.spelllang = 'en_us'


vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    underline = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
            [vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
            [vim.diagnostic.severity.INFO] = icons.diagnostics.info,
            [vim.diagnostic.severity.HINT] = icons.diagnostics.hint
        },
    },
    float = {
        ---@diagnostic disable-next-line: assign-type-mismatch
        border = { " " },
        header = "",
        source = true,
    }
})


-- LSP

-- Provide a custom hover implementation
vim.lsp.buf.hover = require("user.utils.lsp").hover


-------------------------------------------------------
-- Extras
-------------------------------------------------------

if vim.g.neovide then
    require('user.neovide')
end

user = {} ---@diagnostic disable-line: lowercase-global

---@type HighlightYankConfig
user.highlight_yank = {
    enable = true,
    timeout = 400,
    higroup = "IncSearch"
}
