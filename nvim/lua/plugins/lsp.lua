return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		-- Setup Mason to automatically install LSP servers
		require('mason').setup()
		require('mason-lspconfig').setup({ automatic_installation = true })
		local lspconfig = require('lspconfig')
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = false


		local on_attach = function(ev)
			vim.keymap.set('n', '<leader>rs', vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename symbol" })
		end

		-- php - phpactor
		lspconfig.phpactor.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			init_options = {
				["language_server_phpstan.enabled"] = true,
				["language_server_psalm.enabled"] = false,
			}
		})

		-- GO
		lspconfig.gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities
		})
		-- Tailwind CSS
		--require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

		-- Format on save.
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = '*.go',
			callback = function()
				vim.lsp.buf.format { async = false }
			end
		})

		-- Typescript
		lspconfig.tsserver.setup({
			capabilities = capabilities
		})

		-- lua
		lspconfig.lua_ls.setup({
			on_init = function(client)
				local path = client.workspace_folders[1].name
				if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
					client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
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
						}
					})
				end
				return true
			end,
			capabilities = capabilities
		})

	end
}
