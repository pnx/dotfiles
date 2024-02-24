return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'L3MON4D3/LuaSnip',
		'onsails/lspkind-nvim',
	},
	config = function()
		local cmp = require('cmp')

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			preselect = false,
			view = {
				entries = { name = 'custom', selection_order = 'near_cursor' },
			},
			mapping = {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			},
			formatting = {
				format = function(entry, vim_item)
					if vim.tbl_contains({ 'path' }, entry.source.name) then
						local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
						if icon then
							vim_item.kind = icon
							vim_item.kind_hl_group = hl_group
							return vim_item
						end
					end
					return require('lspkind').cmp_format({ with_text = true })(entry, vim_item)
				end
			},
			sources = {
				{ name = 'nvim_lsp', max_item_count = 10 },
				{ name = 'nvim_lsp_signature_help' },
				{ name = 'buffer' },
				{ name = 'path' },
			},
		})
	end
}
