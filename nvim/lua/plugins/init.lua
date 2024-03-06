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

	{ import = "plugins.dashboard" },

	-- Highlight
	{ import = "plugins.colorscheme" },

	{ import = "plugins.indent" },
	{ import = "plugins.nvim-autopairs" },
	{ import = "plugins.mini-comment" },
	{ import = "plugins.barbar" },

	-- Filetree
	{ import = "plugins.neo-tree" },

	-- Status line
	{ import = "plugins.lualine" },

	-- Fuzzy finder
	{ import = "plugins.telescope" },

	-- Keybind helper
	{ import = "plugins.which-key" },

	-- Treesitter
	{ import = "plugins.treesitter" },

	{ import = "plugins.neotest" },

	-- LSP
	{ import = "plugins.lsp" },
	{ import = "plugins.nvim-cmp" },

	{ import = "plugins.go" },

	{ import = "plugins.nvim-test" },

	-- Git changes in gutter
	{ import = "plugins.gitsigns" },
})

