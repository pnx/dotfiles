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
			["<leader>ca"] = { vim.lsp.buf.code_action, { desc = "Code action" }},
			["<leader>ff"] = { vim.lsp.buf.format, { desc = "Format file" }},
			gd = { vim.lsp.buf.definition, { desc = "Goto definition" }},
			gi = { vim.lsp.buf.implementation, { desc = "Goto implementation"}},
			gr = { vim.lsp.buf.references, { desc = "Goto references"}},
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
			gopls = {
				-- format_on_save = true,
				on_save = function ()
					local params = vim.lsp.util.make_range_params()
					params.context = {only = {"source.organizeImports"}}
					local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
					for cid, res in pairs(result or {}) do
						for _, r in pairs(res.result or {}) do
							if r.edit then
								local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
								vim.lsp.util.apply_workspace_edit(r.edit, enc)
							end
						end
					end
					vim.lsp.buf.format({async = false})
				end,
				settings = {
					gopls = {
						analyses = {
							unusedvariable = true,
							unusedwrite = true,
							useany = true
						},
						gofumpt = true,
					},
				},
			},
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
		local augroup = vim.api.nvim_create_augroup("Lsp", {})
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

		for name, server_opt in pairs(opts.servers) do
			local on_attach = function(client, bufnr)
				for bind, settings in pairs(opts.mappings) do
					vim.keymap.set('n', bind, settings[1], vim.tbl_deep_extend("force", settings[2], { buffer = bufnr }))
				end

				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

				-- Add format on save if configured and client supports it.
				if server_opt.format_on_save and client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end

				if server_opt.on_save then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = server_opt.on_save,
					})
				end

				vim.api.nvim_create_autocmd("CursorHold", {
					group = augroup,
					buffer = bufnr,
					callback = function() vim.lsp.buf.document_highlight() end
				})

				vim.api.nvim_create_autocmd("CursorHoldI", {
					group = augroup,
					buffer = bufnr,
					callback = function() vim.lsp.buf.document_highlight() end
				})

				vim.api.nvim_create_autocmd("CursorMoved", {
					group = augroup,
					buffer = bufnr,
					callback = function() vim.lsp.buf.clear_references() end
				})
			end

			lspconfig[name].setup({
				settings = server_opt.settings or {},
				capabilities = capabilities,
				on_attach = on_attach
			})
		end
	end
}
