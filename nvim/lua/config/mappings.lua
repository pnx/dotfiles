local map = vim.keymap.set
local cmd = vim.cmd

vim.g.mapleader = " "

-- Undo/Redo in insert mode
map("i", "<C-z>", cmd.undo)
map("i", "<C-y>", cmd.redo)

-- Ctrl+s saves the current buffer in normal/insert mode.
map("n", "<C-s>", cmd.w)
map("i", "<C-s>", cmd.w)

-- Move Text
map("n", "<S-a>", ":m+1<CR>")
map("n", "<S-d>", ":m-2<CR>")

-- Indent

-- Make Shift-Tab undo indent.
map("i", "<S-Tab>", "<C-d>")
