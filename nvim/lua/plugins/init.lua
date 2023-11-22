local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- Highlight
	--{ import = "plugins.kodex" },
	{ import = "plugins.colortheme-kanagawa" },

	-- Status line
	{ import = "plugins.lualine" },

	-- Fuzzy finder
 	{ import = "plugins.telescope" },

	-- Keybind helper
	-- { import = "plugins.which-key" },

	-- Treesitter
	{ import = "plugins.treesitter" },

	-- Complete
	-- { import = "plugins.cmp" },

	-- LSP
	{ import = "plugins.lsp" },

	-- Git changes in gutter
	--{ import = "plugins.gitsigns" },
})

