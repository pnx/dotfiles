local buffers = require('user.utils.buffers')
local telescope = require('user.utils.telescope')

---@diagnostic disable-next-line: inject-field
vim.g.mapleader = ' '

-- NOPE
vim.keymap.set('n', 'Q', '<nop>')

--
-- Editing
--
vim.keymap.set("n", "<leader>W", "<cmd>lua vim.opt.list = not vim.opt.list._value<cr>",
    { silent = true, desc = "Toggle show whitespace" })
vim.keymap.set({ 'n', 'i' }, '<C-s>', vim.cmd.w, { desc = 'Save current buffer' })

-- Indent
vim.keymap.set('n', '<Tab>', '^=$')
vim.keymap.set('x', '<Tab>', '=', { desc = 'auto indent selection' })
vim.keymap.set('i', '<S-Tab', '<C-d>', { desc = 'delete indent' })

-- Move text
vim.keymap.set('n', '<S-a>', [[:m -2<CR>v=]], { silent = true, desc = 'move current line one line up' })
vim.keymap.set('n', '<S-d>', [[:m +1<CR>v=]], { silent = true, desc = 'move current line one line down' })
vim.keymap.set('v', '<S-a>', [[:m '<-2<CR>gv=gv]], { silent = true, desc = 'move current selection one line up' })
vim.keymap.set('v', '<S-d>', [[:m '>+1<CR>gv=gv]], { silent = true, desc = 'move current selection one line down' })

-- Undo tree
vim.keymap.set('n', '<leader>u', [[:UndotreeToggle<CR>:UndotreeFocus<CR>]], { desc = 'Toggle undotree' })

--
-- Editing - formatting
--

vim.keymap.set('n', '<leader>f', "noop", { desc = 'Formatting' })
vim.keymap.set('n', '<leader>fs', [[ma<CR>:%s/\s\+$//ge<CR>`a]], { desc = 'Remove trailing spaces' })
vim.keymap.set('n', '<leader>ff', [[:Format<CR>]], { desc = 'Format file', silent = true, })
vim.keymap.set('x', '<leader>ff', [[:Format<CR>]], { desc = 'Format section', silent = true, })

-- Hex Formatting
vim.keymap.set('x', '<leader>fh', "noop", { desc = "Format hex" })
vim.keymap.set('x', '<leader>fhx', [[:s/\(\x\{2\}\)/0x\1, /g]],
    { desc = "Format a hex string into a comma separated list with 0x prefix." })
vim.keymap.set('x', '<leader>fha', [[:s/0x\(\x\{1\}\X\)/0x0\1/g]],
    { desc = "Align a hex string so that all numbers are 2 characters long (0x2 -> 0x02) " })
vim.keymap.set('x', '<leader>fhn', [[:s/\(\(0x\x\{1,2\}, \)\{8\}\)/\1\r/g]],
    { desc = "Format a comma separated hex list into 8 bytes per line." })

-- Paths
vim.keymap.set('x', '<leader>fp', "noop", { desc = "Format path" })
vim.keymap.set('x', '<leader>fpw', [[:s~/~\\\\~g<CR>]], { desc = "Format path from linux to windows" })
vim.keymap.set('x', '<leader>fpl', [[:s~\\\\~/~g<CR>]], { desc = "Format path from windows to linux" })

--
-- Editing - Copy / Paste
--

-- Maintain the cursor position when yanking a visual selection.
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

-- Indent and move to the end when pasting.
vim.keymap.set({ 'n', 'x' }, 'p', 'p`[v`]=`>')

vim.keymap.set({ 'n', 'x' }, '<leader>y', [["+y]], {desc = "Yank into system register"})
vim.keymap.set({ 'n', 'x' }, '<leader>p', [["+p]], {desc = "Paste system register"})
vim.keymap.set('x', '<leader>p', [["_dP]], { silent = true, desc = "Paste without storing deleted content in register" })


--
-- Splits
--

vim.keymap.set('n', '<S-f>', '<cmd>vs<cr>', { desc = "Vertical split"})

--
-- Navigation
--

vim.keymap.set('n', '<S-Up>', 'v<Up>')
vim.keymap.set('n', '<S-Down>', 'v<Down>')
vim.keymap.set('v', '<S-Up>', '<Up>')
vim.keymap.set('v', '<S-Down>', '<Down>')

vim.keymap.set('n', '}', '}zz', { silent = true, desc = 'jump to next paragraph' })
vim.keymap.set('n', '{', '{zz', { silent = true, desc = 'jump to previous paragraph' })

-- Make half page jumps stay in the center of screen
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true, desc = 'jump half a page up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true, desc = 'jump half a page down' })
vim.keymap.set('n', '<S-PageUp>', '<C-u>zz', { silent = true, desc = 'jump half a page up' })
vim.keymap.set('n', '<S-PageDown>', '<C-d>zz', { silent = true, desc = 'jump half a page down' })

vim.keymap.set('n', '<leader><leader>', '<cmd>edit #<cr>', { silent = true, desc = "Goto alternative file" })

--
-- Buffers
--
vim.keymap.set('n', '<leader>b', "noop", { desc = 'Buffers' })
vim.keymap.set('n', '<leader>bd', buffers.CloseCurrent, { silent = true, desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>bc', buffers.CloseOthers, { silent = true, desc = 'Close all other buffers' })
vim.keymap.set('n', '<leader>bD', buffers.CloseAll, { silent = true, desc = 'Close all buffers' })

--
-- Diagnostics
--

vim.keymap.set('n', '<leader>d', "noop", { desc = 'Diagnostics' })
vim.keymap.set('n', "<leader>dk", vim.diagnostic.open_float, { desc = "Show diagnostic message under cursor" })
vim.keymap.set('n', "<leader>dn", vim.diagnostic.get_next, { desc = "Goto next" })
vim.keymap.set('n', "<leader>dp", vim.diagnostic.get_prev, { desc = "Goto previous" })
vim.keymap.set('n', "<leader>dd", "<cmd>Telescope diagnostics<cr>", { desc = "Open workspace diagnostics" })

--
-- Testing
--
vim.keymap.set('n', '<leader>t', "noop", { desc = 'Testing' })
vim.keymap.set('n', "<leader>tc", "<cmd>Neotest run<cr>", { desc = "Test current (test near cursor)" })
vim.keymap.set('n', "<leader>tf", "<cmd>Neotest run file<cr>", { desc = "Test current (file)" })
vim.keymap.set('n', "<leader>ts", "<cmd>Neotest summary<cr>", { desc = "Toggle test summary" })

--
-- File explorer
--
vim.keymap.set('n', "<leader>.", "<cmd>NvimTreeFocus<cr>", { desc = "Toggle Nvimtree" })

--
-- Git
--
vim.keymap.set('n', '<leader>g', "noop", { desc = 'Git' })
vim.keymap.set('n', "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview section at cursor" })
vim.keymap.set('n', "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset section at cursor" })
vim.keymap.set('n', "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset buffer" })
vim.keymap.set('n', "<leader>gv", "<cmd>Gitsigns select_hunk<cr>", { desc = "Select section under cursor" })
vim.keymap.set('n', "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame (current line)" })
vim.keymap.set('n', "<leader>gB", "<cmd>Gitsigns blame<cr>", { desc = "Blame" })

--
-- LSP
--

vim.keymap.set('n', 'go', '<cmd>Telescope lsp_type_definitions<cr>', { desc = 'Goto type definition' })
vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', { desc = 'Goto definition' })
vim.keymap.set({ 'n', 'x' }, '<leader>c', 'noop', { desc = 'Code' })
vim.keymap.set({ 'n', 'x' }, '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'Code action' })
vim.keymap.set({ 'n', 'x' }, '<leader>cl', '<cmd>lua vim.lsp.codelens.run()<cr>', { desc = 'Code lens' })
vim.keymap.set('n', '<leader>r', "noop", { desc = 'Rename' })
vim.keymap.set('n', '<leader>rs', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename symbol' })

--
-- Search
--

vim.keymap.set('n', '<leader>s', "noop", { desc = 'Search' })
vim.keymap.set('n', '<leader>sf', '<cmd>Telescope find_files<cr>', { desc = 'Search files' })
vim.keymap.set('n', '<leader>sF', telescope.all_files, { desc = 'Search all files' })
vim.keymap.set('n', '<leader>s.', telescope.find_in_current_dir, { desc = 'Find files in current directory' })
vim.keymap.set('n', '<leader>sw', '<cmd>Telescope grep_string<cr>', { desc = 'Search for word under cursor' })
vim.keymap.set('n', '<leader>sa', '<cmd>Telescope live_grep<cr>', { desc = 'Search in files' })
vim.keymap.set('n', '<leader>sb', '<cmd>Telescope buffers<cr>', { desc = 'Search Buffers' })
vim.keymap.set('n', '<leader>sg', '<cmd>Telescope git_files<cr>', { desc = 'Search Git files' })
vim.keymap.set('n', '<leader>sG', '<cmd>Telescope git_status<cr>', { desc = 'Search Git status' })
vim.keymap.set('n', '<leader>sc', '<cmd>Telescope git_commits<cr>', { desc = 'Search Git commits' })
vim.keymap.set('n', '<leader>so', '<cmd>Telescope oldfiles<cr>', { desc = 'Search old files' })
vim.keymap.set('n', '<leader>sd', '<cmd>Telescope diagnostics<cr>', { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>sq', '<cmd>Telescope quickfix<cr>', { desc = 'Search Quickfix' })
vim.keymap.set('n', '<leader>sr', '<cmd>Telescope lsp_references<cr>', { desc = 'Search Reference' })
vim.keymap.set('n', '<leader>ss', '<cmd>Telescope lsp_document_symbols<cr>', { desc = 'Search document symbols' })
vim.keymap.set('n', '<leader>si', '<cmd>Telescope lsp_implementations<cr>', { desc = 'Search Inplementations' })
vim.keymap.set('n', '<leader>sp', telescope.find_workspace_symbols, { desc = 'Search Workspace symbols' })
vim.keymap.set('n', '<leader>sj', telescope.find_classes, { desc = 'Search Classes' })
vim.keymap.set('n', '<leader>sk', telescope.find_functions, { desc = 'Search Functions' })
vim.keymap.set('n', '<leader>sh', '<cmd>Telescope help<cr>', { desc = 'Search Neovim help' })

vim.keymap.set('n', '<leader>jj', require('user.utils.misc').toggle_gutter)
