return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
	},
	opts = {
		mappings = {
			["<leader>rs"] = { vim.lsp.buf.rename, { desc = "Rename symbol" }},
			gd = { vim.lsp.buf.definition, { desc = "Goto definition" }}
		},
		servers = {
			phpactor = {
				settings = {
					init_options = {
						["language_server_phpstan.enabled"] = true,
						["language_server_psalm.enabled"] = false,
					}
				}
			},
			gopls = {},
			lua_ls = {
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT'
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME
							}
						}
					},
				},
			},
		},
	},
	config = function (_, opts)
		-- Setup Mason to automatically install LSP servers
		require('mason').setup()
		require('mason-lspconfig').setup({ automatic_installation = true })
		local lspconfig = require('lspconfig')
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = false

		vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
			vim.lsp.handlers.hover,
			{border = 'single'}
		)

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			focusable = true,
			style = "minimal",
			border = "single",
		})

		local on_attach = function(ev)
			for bind, settings in pairs(opts.mappings) do
				vim.keymap.set('n', bind, settings[1], vim.tbl_deep_extend("force", settings[2], { buffer = ev.buf }))
			end
		end

		for name, server_opt in pairs(opts.servers) do

			local settings = vim.tbl_deep_extend("force", server_opt.settings or {}, {
				capabilities = capabilities,
				on_attach = on_attach
			})
			lspconfig[name].setup(settings)
		end
	end
}
