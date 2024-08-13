vim.g.lsp_zero_ui_float_border = vim.g.float_border or "none"

return {
	document_highlight = true,
	nonels = function()
		local null_ls = require("null-ls")
		return {
			--null_ls.builtins.completion.luasnip,
			null_ls.builtins.code_actions.gomodifytags,
			null_ls.builtins.code_actions.impl,
			null_ls.builtins.code_actions.gitsigns,
			null_ls.builtins.diagnostics.phpstan,
			null_ls.builtins.diagnostics.phpcs,
			null_ls.builtins.diagnostics.checkmake,
			null_ls.builtins.diagnostics.actionlint,
			null_ls.builtins.diagnostics.cppcheck,
			null_ls.builtins.diagnostics.dotenv_linter,
		}
	end,
	servers = {
		-- Bash
		bashls = {},
		-- C/C++
		ccls = {},
		-- PHP
		intelephense = {},
		-- phpactor = {
		-- 	settings = {
		-- 		init_options = {
		-- 			["language_server_phpstan.enabled"] = true,
		-- 			["language_server_psalm.enabled"] = false,
		-- 		},
		-- 	},
		-- },
		-- JS,TS,VUE
		tsserver = {
			document_highlight = false,
			settings = {
				tsserver_plugins = {
					"@vue/typescript-plugin",
				},
			},
			filetypes = { "javascript", "typescript", "vue" },
		},
		volar = {
			init_options = {
				vue = {
					hybridMode = false,
				},
			},
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
		},
		-- TailwindCSS
		tailwindcss = {},
		-- GO
		gopls = {
			on_save = function()
				local params = vim.lsp.util.make_range_params()
				params.context = { only = { "source.organizeImports" } }
				local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
				for cid, res in pairs(result or {}) do
					for _, r in pairs(res.result or {}) do
						if r.edit then
							local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
							vim.lsp.util.apply_workspace_edit(r.edit, enc)
						end
					end
				end
				vim.lsp.buf.format({ async = false })
			end,
			settings = {
				gopls = {
					analyses = {
						unusedvariable = true,
						unusedwrite = true,
						useany = true,
					},
					gofumpt = true,
				},
			},
		},
		-- Lua
		lua_ls = {
			cmd = { "/opt/luals/bin/lua-language-server", "--logpath=~/.local/luals/logs" },
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				},
			},
		},
	},
}
