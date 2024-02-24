-- Basic ones
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "<C-z>", vim.cmd.undo)
vim.keymap.set("i", "<C-y>", vim.cmd.redo)

-- Ctrl+s saves the current buffer in normal/insert mode.
vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("i", "<C-s>", vim.cmd.w)

-- Disable arrow keys (force me to use hjkl)

vim.keymap.set("n", "<Up>", "", { noremap=true })
vim.keymap.set("n", "<Down>", "", { noremap=true })
vim.keymap.set("n", "<Left>", "", { noremap=true })
vim.keymap.set("n", "<Right>", "", { noremap=true })

vim.keymap.set("i", "<Up>", "", { noremap=true })
vim.keymap.set("i", "<Down>", "", { noremap=true })
vim.keymap.set("i", "<Left>", "", { noremap=true })
vim.keymap.set("i", "<Right>", "", { noremap=true })

vim.keymap.set("v", "<Up>", "", { noremap=true })
vim.keymap.set("v", "<Down>", "", { noremap=true })
vim.keymap.set("v", "<Left>", "", { noremap=true })
vim.keymap.set("v", "<Right>", "", { noremap=true })
-- Move Text
--vim.keymap.set("n", "<S-a>", ":m+1<CR>")
--vim.keymap.set("v", "<S-d>", ":m-2<CR>")

--vim.keymap.set("v", "<S-a>", ":m+1<CR>")
--vim.keymap.set("n", "<S-d>", ":m-2<CR>")

-- Indent

-- Make Shift-Tab undo indent.
vim.keymap.set("i", "<S-Tab>", "<C-d>")

-- NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", { noremap=true })
