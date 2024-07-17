local cmd = vim.cmd
local icons = require('config.icons')
local buffers = require('utils.buffers')
local telescope = require('utils.telescope')

return {
    leader = " ",

    --
    -- Global keymaps! Alot of stuff "borrowed" from thePrimeagen
    --
    global = {

        { "n",          "<leader>W",    "<cmd>lua vim.opt.list = not vim.opt.list._value<cr>",          { silent = true, desc = "Toggle show whitespace" } },

        --
        -- Navigation
        --

        -- Make half page jumps stay in the center of screen
        { "n",          "<C-u>",        "<C-u>zz",          { silent = true, desc = "jump half a page up" } },
        { "n",          "<C-d>",        "<C-d>zz",          { silent = true, desc = "jump half a page down" } },
        { "n",          "<S-PageUp>",   "<C-u>zz",          { silent = true, desc = "jump half a page up" } },
        { "n",          "<S-PageDown>", "<C-d>zz",          { silent = true, desc = "jump half a page down" } },

        -- Split windows
        { "n",          "<C-h>",        "<C-w>h",          { silent = true, desc = "Focus left split" } },
        { "n",          "<C-j>",        "<C-w>j",          { silent = true, desc = "Focus down split" } },
        { "n",          "<C-k>",        "<C-w>k",          { silent = true, desc = "Focus up split" } },
        { "n",          "<C-l>",        "<C-w>l",          { silent = true, desc = "Focus right split" } },

        -- Make jump to next search item stay in the center of screen.
        { "n",          "n",            "nzzzv",            { silent = true, desc = "jump to next search match" } },
        { "n",          "N",            "Nzzzv",            { silent = true, desc = "jump to previous search match" } },

        -- Ctrl+s saves the current buffer in normal/insert mode.
        { { "n", "i" }, "<C-s>",        cmd.w,              { desc = "save current buffer" } },

        -- Move text
        { "n",          "<S-a>",        ":m -2<CR>v=",      { silent = true, desc = "move current line one line up" } },
        { "n",          "<S-d>",        ":m +1<CR>v=",      { silent = true, desc = "move current line one line down" } },
        { "v",          "<S-a>",        ":m '<-2<CR>gv=gv", { silent = true, desc = "move current selection one line up" } },
        { "v",          "<S-d>",        ":m '>+1<CR>gv=gv", { silent = true, desc = "move current selection one line down" } },

        -- copy/paste
        { "x", "<leader>p", [["_dP]],
            { silent = true, desc = "Paste over selected text without losing content in \"-register" } },
        { { "n", "v" }, "<leader>y",  [["+y]],                          { desc = "Yank to system clipboard register" } },
        { { "n", "v" }, "<leader>p",  [["+p]],                          { desc = "Paste from system clipboard register" } },

        -- File operations
        --{ "n",          "gf", "<cmd>e <cfile><CR>",                     { silent = true, desc = "Open (or create) file under cursor" } },
        { "n",          "<leader>Fc", ":CreateFile ",                   { silent = true, desc = "Create new file" } },
        { "n",          "<leader>Fx", "<cmd>!chmod +x %<CR>",           { silent = true, desc = "Set execute flag on current file" } },

        -- buffers
        { "n",          "<leader>bn", cmd.bn,                           { silent = true, desc = "Move to next buffer" } },
        { "n",          "<leader>bb", cmd.bp,                           { silent = true, desc = "Move to previous buffer" } },
        { "n",          "<leader>bd", cmd.bd,                           { silent = true, desc = "Close current buffer" } },
        { "n",          "<leader>bc", buffers.CloseOthers,              { silent = true, desc = "Close all other buffers" } },
        { "n",          "<leader>bD", buffers.CloseAll,                 { silent = true, desc = "Close all buffers" } },

        -- Indent
        { 'n',          "<Tab>",      "^=$" },
        { 'x',          "<Tab>",      "=",                              { desc = "auto indent selection" } },
        { "i",          "<S-Tab>",    "<C-d>",                          { desc = "delete indent" } },
        { 'n',          "<leader>fs", [[:%s/\s\+$//g<CR>`']],           { desc = "Remove trailing spaces" } },

        -- fix paste
        -- {'n', "p", "p=$"},

        -- Crazy search+replace
        { "n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
            { desc = "search+replace word under cursor" } },

        -- Hex formatting
        { "x", "<leader>fhx", [[:s/\(\x\{2\}\)/0x\1, /g]],              { desc = "Format hex" } },
        { "x", "<leader>fha", [[:s/0x\(\x\{1\}\X\)/0x0\1/g]],           { desc = "Format each hex number to be 2 characters long" } },
        { "x", "<leader>fhn", [[:s/\(\(0x\x\{1,2\}, \)\{8\}\)/\1\r/g]], { desc = "Format hex with 8 bytes per row" } },
        -- {{"x"}, "<leader>hb", [[:'<,'>s/\(\x\{2\}\)/0x\1, /g<cr>]], { desc = "Format a hex string to byte array"}},

        -- Case formatting
        { "x", "<leader>fcsc", [[:s/\%V\([a-z]\+\)_\?/\u\1/g]],              { desc = "Convert text from snake_case to CamelCase" } },

        -- diagnostics
        { "n",     "<leader>do",  vim.diagnostic.open_float,                { desc = "Open diagnostics" } },
        { "n",     "<leader>dn",  vim.diagnostic.get_next,                  { desc = "Goto next" } },
        { "n",     "<leader>dp",  vim.diagnostic.get_prev,                  { desc = "Goto previous" } },

        -- TMux
        { "n",     "<leader>m",   ":terminal tmuxs<cr>i",                   { desc = "Open tmux manager" } },


        { "n",     "Q",           "<nop>" }, -- NOPE

    },
    whichkey = {
        mode = { "n", "v", "x" },
        { "<leader>F", group = "Files" },
        { "<leader>b", group = "Buffers", icon = icons.buffer },
        { "<leader>c", group = "Code" },
        { "<leader>d", group = "Diagnostics" },
        { "<leader>f", group = "Format" },
        { "<leader>fc", group = "Case" },
        { "<leader>fcs", group = "snake_case" },
        { "<leader>fh", group = "Hex", icon = icons.symbols.NumberHex },
        { "<leader>g", group = "git" },
        { "<leader>r", group = "Rename", icon = icons.edit },
        { "<leader>s", group = "Search" },
    },
    oil = {
        { '<leader>.', function() require('oil').open_float() end, { desc = "Open parent directory" } }
    },
    conform = {
        { '<leader>ff', "<cmd>Format<cr>", desc = 'Format file' },
		{ '<leader>ff', "<cmd>Format<cr>", mode = 'x', desc = 'Format selection' },
    },
    fugitive = {
        { '<leader>gB', '<cmd>Git blame<cr>',   desc = 'Git blame' },
        { '<leader>gs', '<cmd>Git status<cr>',   desc = 'Git status' },
        { '<leader>gl', '<cmd>Git log<cr>',   desc = 'Git log' },
        { '<leader>gL', '<cmd>Git log %<cr>',   desc = 'Git log current file' },
    },
    gitsigns = {
        { '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', desc = 'Git preview diff' },
        { '<leader>gb', '<cmd>Gitsigns blame_line<cr>',   desc = 'Git blame line' }
    },
    trouble = {
        { '<leader>dt', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Trouble diagnostics' },
    },
    -- Keybinds for buffers with an LSP client attached
    lsp = {
        { 'K',          function() vim.lsp.buf.hover() end,           desc = '' },
        { '<leader>ca', function() vim.lsp.buf.code_action() end,     mode={'n', 'x'}, desc = 'Code action' },
        { '<leader>rs', function() vim.lsp.buf.rename() end,          desc = 'Rename symbol' },
        { '<leader>sr', '<cmd>Telescope lsp_references<cr>',          desc = 'Search Reference' },
        { '<leader>ss', '<cmd>Telescope lsp_document_symbols<cr>',    desc = 'Search document symbols' },
        { '<leader>si', '<cmd>Telescope lsp_implementations<cr>',     desc = 'Search Inplementations' },
        { '<leader>sp', '<cmd>Telescope lsp_workspace_symbols<cr>',   desc = 'Search Workspace symbols' },
        { 'go',         '<cmd>Telescope lsp_type_definitions<cr>',    desc = "Goto type definition" },
        { 'gd',         '<cmd>Telescope lsp_definitions<cr>',         desc = 'Goto definition' },
    },
    telescope = {
        { '<leader>sf', '<cmd>Telescope find_files<cr>',            desc = 'Search files' },
        { '<leader>sF', telescope.all_files,                        desc = 'Search all files' },
        { '<leader>sb', '<cmd>Telescope buffers<cr>',               desc = 'Search buffers' },
        { '<leader>sa', '<cmd>Telescope live_grep<cr>',             desc = 'Search in files' },
        { '<leader>sg', '<cmd>Telescope git_files<cr>',             desc = 'Search Git files' },
        { '<leader>sG', '<cmd>Telescope git_status<cr>',            desc = 'Search Git status' },
        { '<leader>so', '<cmd>Telescope oldfiles<cr>',              desc = 'Search Old files' },
        { '<leader>sw', '<cmd>Telescope grep_string<cr>',           desc = 'Search for word under cursor' },
        { '<leader>sd', '<cmd>Telescope diagnostics<cr>',           desc = 'Search Diagnostics' },
        { '<leader>sq', '<cmd>Telescope quickfix<cr>',              desc = 'Search Quickfix' },
        { '<leader>sh', '<cmd>Telescope help<cr>',                  desc = 'Search Neovim help' },
    },
}
