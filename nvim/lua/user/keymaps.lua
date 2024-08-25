local buffers = require('user.utils.buffers')
local telescope = require('user.utils.telescope')

vim.g.mapleader = ' '

-- NOPE
vim.keymap.set('n', 'Q', '<nop>')

--
-- Editing
--
vim.keymap.set("n", "<leader>W", "<cmd>lua vim.opt.list = not vim.opt.list._value<cr>",          { silent = true, desc = "Toggle show whitespace" })
vim.keymap.set({'n', 'i'}, '<C-s>', vim.cmd.w, { desc = 'Save current buffer' })

-- Indent
vim.keymap.set('n',          '<Tab>',      '^=$')
vim.keymap.set('x',          '<Tab>',      '=', { desc = 'auto indent selection' })
vim.keymap.set('i', '<S-Tab', '<C-d>', { desc = 'delete indent' })


--
-- Editing - formatting
--

vim.keymap.set('n', '<leader>fs', [[:%s/\s\+$//g<CR>`']], { desc = 'Remove trailing spaces' })

-- Hex Formatting
vim.keymap.set('x', '<leader>fhx', [[:s/\(\x\{2\}\)/0x\1, /g]], { desc = "Format hex" })
vim.keymap.set('x', '<leader>fha', [[:s/0x\(\x\{1\}\X\)/0x0\1/g]], { desc = "Format hex" })
vim.keymap.set('x', '<leader>fhn', [[:s/\(\(0x\x\{1,2\}, \)\{8\}\)/\1\r/g]], { desc = "Format hex" })

-- Case formatting
vim.keymap.set("x", "<leader>fcsc", [[:s/\%V\([a-z]\+\)_\?/\u\1/g]],              { desc = "Convert text from snake_case to CamelCase" })


-- copy/paste

vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]], {})
vim.keymap.set({'n', 'v'}, '<leader>p', [["+p]], {})
vim.keymap.set('x', '<leader>p', [["_dP]], {silent = true })

--
-- Navigation
--

-- Move text
vim.keymap.set('n', '<S-a>', [[:m -2<CR>v=]], { silent = true, desc = 'move current line one line up' })
vim.keymap.set('n', '<S-d>', [[:m +1<CR>v=]], { silent = true, desc = 'move current line one line down' })
vim.keymap.set('v', '<S-a>', [[:m '<-2<CR>gv=gv]], { silent = true, desc = 'move current selection one line up'  })
vim.keymap.set('v', '<S-d>', [[:m '>+1<CR>gv=gv]], { silent = true, desc = 'move current selection one line down' })

-- Make half page jumps stay in the center of screen
vim.keymap.set('n', '<C-u>',        '<C-u>zz', { silent = true, desc = 'jump half a page up'})
vim.keymap.set('n', '<C-d>',        '<C-d>zz', { silent = true, desc = 'jump half a page down'})
vim.keymap.set('n', '<S-PageUp>',   '<C-u>zz', { silent = true, desc = 'jump half a page up'})
vim.keymap.set('n', '<S-PageDown>', '<C-d>zz', { silent = true, desc = 'jump half a page down'})

--
-- Buffers
--
-- vim.keymap.set('n', '<leader>bn', vim.cmd.bn,             { silent = true, desc = 'Move to next buffer' })
-- vim.keymap.set('n', '<leader>bb', vim.cmd.bp,             { silent = true, desc = 'Move to previous buffer' })
-- vim.keymap.set('n', '<leader>bd', vim.cmd.bd,             { silent = true, desc = 'Close current buffer' })
-- vim.keymap.set('n', '<leader>bd', '<cmd>bp | bd #<cr>',             { silent = true, desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>bd', buffers.CloseCurrent,             { silent = true, desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>bc', buffers.CloseOthers,    { silent = true, desc = 'Close all other buffers' })
vim.keymap.set('n', '<leader>bD', buffers.CloseAll,       { silent = true, desc = 'Close all buffers' })

--
-- Diagnostics
--:bp | bd #

vim.keymap.set('n', "<leader>do",  vim.diagnostic.open_float,                {desc = "Open diagnostics" })
vim.keymap.set('n', "<leader>dn",  vim.diagnostic.get_next,                  {desc = "Goto next" })
vim.keymap.set('n', "<leader>dp",  vim.diagnostic.get_prev,                  {desc = "Goto previous" })

--
-- File explorer
--
vim.keymap.set('n', "<leader>.",  "<cmd>Neotree toggle<cr>",                  {desc = "Toggle Neotree" })

--
-- Git
--
vim.keymap.set('n', "<leader>gp",  "<cmd>Gitsigns preview_hunk<cr>",                {desc = "Preview section at cursor" })
vim.keymap.set('n', "<leader>gr",  "<cmd>Gitsigns reset_hunk<cr>",                  {desc = "Reset section at cursor" })
vim.keymap.set('n', "<leader>gR",  "<cmd>Gitsigns reset_buffer<cr>",                {desc = "Reset buffer" })
vim.keymap.set('n', "<leader>gv",  "<cmd>Gitsigns select_hunk<cr>",                 {desc = "Select section under cursor" })

--
-- LSP
--

vim.keymap.set('n',         'go',         '<cmd>Telescope lsp_type_definitions<cr>',        {desc = 'Goto type definition' })
vim.keymap.set('n',         'gd',         '<cmd>Telescope lsp_definitions<cr>',             {desc = 'Goto definition' })
vim.keymap.set({'n', 'x'},  '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>',         {desc = 'Code action' })
vim.keymap.set('n',         '<leader>rs', '<cmd>lua vim.lsp.buf.rename()<cr>',              {desc = 'Rename symbol'} )

--
-- Search
--

vim.keymap.set('n', '<leader>sf', '<cmd>Telescope find_files<cr>',              { desc = 'Search files' })
vim.keymap.set('n', '<leader>sF', telescope.all_files,                          { desc = 'Search all files' })
vim.keymap.set('n', '<leader>sw', '<cmd>Telescope grep_string<cr>',             { desc = 'Search for word under cursor' })
vim.keymap.set('n', '<leader>sa', '<cmd>Telescope live_grep<cr>',               { desc = 'Search in files' })
vim.keymap.set('n', '<leader>sb', '<cmd>Telescope buffers<cr>',                 { desc = 'Search Buffers' })
vim.keymap.set('n', '<leader>sg', '<cmd>Telescope git_files<cr>',               { desc = 'Search Git files' })
vim.keymap.set('n', '<leader>sG', '<cmd>Telescope git_status<cr>',              { desc = 'Search Git status' })
vim.keymap.set('n', '<leader>sc', '<cmd>Telescope git_commits<cr>',             { desc = 'Search Git commits' })
vim.keymap.set('n', '<leader>so', '<cmd>Telescope oldfiles<cr>',                { desc = 'Search old files' })
vim.keymap.set('n', '<leader>sd', '<cmd>Telescope diagnostics<cr>',             { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>sq', '<cmd>Telescope quickfix<cr>',                { desc = 'Search Quickfix' })
vim.keymap.set('n', '<leader>sr', '<cmd>Telescope lsp_references<cr>',          { desc = 'Search Reference' })
vim.keymap.set('n', '<leader>ss', '<cmd>Telescope lsp_document_symbols<cr>',    { desc = 'Search document symbols' })
vim.keymap.set('n', '<leader>si', '<cmd>Telescope lsp_implementations<cr>',     { desc = 'Search Inplementations' })
vim.keymap.set('n', '<leader>sp', '<cmd>Telescope lsp_workspace_symbols<cr>',   { desc = 'Search Workspace symbols' })
vim.keymap.set('n', '<leader>sh', '<cmd>Telescope help<cr>',                    { desc = 'Search Neovim help' })

