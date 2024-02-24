return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		require('plugins.cmp')
	},
	config = function()
		-- Setup Mason to automatically install LSP servers
		require('mason').setup()
		require('mason-lspconfig').setup({ automatic_installation = true })
		local lspconfig = require('lspconfig')
		-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

		-- PHP
		lspconfig.intelephense.setup({
			commands = {
				IntelephenseIndex = {
					function() vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' }) end,
				},
			},
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
			-- capabilities = capabilities
		})

		-- GO
		lspconfig.gopls.setup({})
		-- Tailwind CSS
		--require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

		
		-- Config
		-- Sign configuration
		vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
		vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
		vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
		vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
	end
}
