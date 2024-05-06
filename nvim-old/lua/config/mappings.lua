--
-- Keymaps! Alot of stuff "borrowed" from thePrimeagen
--
local map = vim.keymap.set
local cmd = vim.cmd

vim.g.mapleader = " "

-- Make half page jumps stay in the center of screen
map("n", "<C-u>", "<C-u>zz", { silent = true, desc = "jump half a page up" })
map("n", "<C-d>", "<C-d>zz", { silent = true, desc = "jump half a page down" })
map("n", "<S-PageUp>", "<C-u>zz", { silent = true, desc = "jump half a page up" })
map("n", "<S-PageDown>", "<C-d>zz", { silent = true, desc = "jump half a page down" })
-- Make jump to next search item stay in the center of screen.
map("n", "n", "nzzzv", { silent = true, desc = "jump to next search match" })
map("n", "N", "Nzzzv", { silent = true, desc = "jump to previous search match" })

-- Ctrl+s saves the current buffer in normal/insert mode.
map({ "n", "i" }, "<C-s>", cmd.w, { desc = "save current buffer" })

-- Move text
map("n", "<S-a>", ":m -2<CR>v=", { silent = true, desc = "move current line one line up" })
map("n", "<S-d>", ":m +1<CR>v=", { silent = true, desc = "move current line one line down" })
map("v", "<S-a>", ":m '<-2<CR>gv=gv", { silent = true, desc = "move current selection one line up" })
map("v", "<S-d>", ":m '>+1<CR>gv=gv", { silent = true, desc = "move current selection one line down" })

-- copy/paste
map("x", "<leader>p", [["_dP]],
    { silent = true, desc = "Paste over selected text without losing content in \"-register" })
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard register" })
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard register" })

-- File operations
map("n", "<leader>Fc", ":CreateFile ", { silent = true, desc = "Create new file" })
map("n", "<leader>Fx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Set execute flag on current file" })

-- buffers
map("n", "<leader>bn", cmd.bn, { silent = true, desc = "Move to next buffer" })
map("n", "<leader>bb", cmd.bp, { silent = true, desc = "Move to previous buffer" })
map("n", "<leader>bd", cmd.bd, { silent = true, desc = "Close current buffer" })
map("n", "<leader>bc", "<cmd>BufferLineCloseOthers<cr>", { silent = true, desc = "Close all other buffers" })
map("n", "<leader>bD", "<cmd>%bd<cr>", { silent = true, desc = "Close all buffers" })

-- Indent
map('n', "<Tab>", "^=$")
map('x', "<Tab>", "=", { desc = "auto indent selection" })
map("i", "<S-Tab>", "<C-d>", { desc = "delete indent" })

-- fix paste
-- map('n', "p", "p=$")

-- Crazy search+replace
map("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
    desc = "search+replace word under cursor"
})

map({ "x" }, "<leader>fhx", [[:s/\(\x\{2\}\)/0x\1, /g]], { desc = "Format hex" })
map({ "x" }, "<leader>fha", [[:s/0x\(\x\{1\}\X\)/0x0\1/g]], { desc = "Format each hex number to be 2 characters long" })
map({ "x" }, "<leader>fhn", [[:s/\(\(0x\x\{1,2\}, \)\{8\}\)/\1\r/g]], { desc = "Format hex with 8 bytes per row" })
-- map({"x"}, "<leader>hb", [[:'<,'>s/\(\x\{2\}\)/0x\1, /g<cr>]], { desc = "Format a hex string to byte array"})

-- diagnostics
map("n", "<leader>do", vim.diagnostic.open_float, { desc = "Open diagnostics" })
map("n", "<leader>dn", vim.diagnostic.get_next, { desc = "Goto next" })
map("n", "<leader>dp", vim.diagnostic.get_prev, { desc = "Goto previous" })

-- TMux
map("n", "<leader>m", ":terminal tmuxs<cr>i", { desc = "Open tmux manager" })


map("n", "Q", "<nop>")
