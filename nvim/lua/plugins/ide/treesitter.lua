return {
	'nvim-treesitter/nvim-treesitter',
	build = function()
		require('nvim-treesitter.install').update({ with_sync = true })
	end,
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
		'nvim-treesitter/playground'
	},
	opts = {
		-- A list of parser names
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"ninja",
			"cmake",
			"dockerfile",
			"make",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"php",
			"phpdoc",
			"blade",
			"go",
			"gomod",
			"gosum",
			"javascript",
			"typescript",
			"css",
			"scss",
			"html",
			"vue",
			"json",
			"jsonc",
			"yaml",
			"toml",
			"xml",
			"glsl",
			"hlsl",
			"markdown"
		},

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = true,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = false,

		highlight = {
			enable = true,

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},

		indent = {
			enable = true
		}
	},
	config = function(_, opts)
		local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

		parser_config.blade = {
			install_info = {
				url = 'https://github.com/EmranMR/tree-sitter-blade',
				branch = "main",
				files = { 'src/parser.c' },
				generate_requires_npm = true,
				requires_generate_from_grammar = true,
			},
			filetype = 'blade',
		}

		require("nvim-treesitter.configs").setup(opts)
	end,
}
