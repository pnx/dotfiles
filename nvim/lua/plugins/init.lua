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

local opts = {
	dev = {
		path = "~/code/nvim_plugins",
	}
}

require("lazy").setup({

	-- Editor
	-----------------------------
	{ import = "plugins.editor.indent" },
	{ import = "plugins.editor.autopairs" },
	{ import = "plugins.editor.mini-comment" },
	{ import = "plugins.editor.telescope" },

	-- UI
	-----------------------------
	{ import = "plugins.ui.dressing" },
	{ import = "plugins.ui.noice" },
	{ import = "plugins.ui.dashboard" },
	{ import = "plugins.ui.catppuccin" },
	{ import = "plugins.ui.neo-tree" },
	{ import = "plugins.ui.barbar" },
	{ import = "plugins.ui.barbecue" },
	{ import = "plugins.ui.lualine" },
	{ import = "plugins.ui.gitsigns" },
	{ import = "plugins.ui.which-key" },

	-- IDE
	-----------------------------
	{ import = "plugins.ide.treesitter" },
	{ import = "plugins.ide.conform" },
	{ import = "plugins.ide.cmp" },
	{ import = "plugins.ide.lsp" },
	{ import = "plugins.ide.dap" },
	{ import = "plugins.ide.neotest" },

	-- Language specific
	-----------------------------
	{ import = "plugins.lang.laravel" },
	--{ import = "plugins.lang.go" },

}, opts)

