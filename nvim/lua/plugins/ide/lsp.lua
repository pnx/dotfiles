return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
	},
	opts = {
		mappings = {
			["<leader>rs"] = { vim.lsp.buf.rename, { desc = "Rename symbol" }}
		},
		servers = {
			phpactor = {
				init_options = {
					["language_server_phpstan.enabled"] = true,
					["language_server_psalm.enabled"] = false,
				}
			},
			gopls = {}
		},
	},
	config = function (_, opts)
		-- Setup Mason to automatically install LSP servers
		require('mason').setup()
		require('mason-lspconfig').setup({ automatic_installation = true })
		local lspconfig = require('lspconfig')
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = false

		local on_attach = function(ev)
			for bind, settings in pairs(opts.mappings) do
				vim.keymap.set('n', bind, settings[0], vim.tbl_deep_extend("force", settings[1], { buffer = ev.buf }))
			end

			-- vim.keymap.set('n', '<leader>rs', vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename symbol" })
		end

		for name, settings in pairs(opts.servers) do

			settings = vim.tbl_deep_extend("force", settings, {
				capabilities = capabilities,
				on_attach = on_attach
			})
			lspconfig[name].setup(settings)
		end
	end
}
