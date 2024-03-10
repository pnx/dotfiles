return {
	'hrsh7th/nvim-cmp',
	version = false,
	event = "InsertEnter",
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-nvim-lsp',
		'L3MON4D3/LuaSnip',
		'onsails/lspkind-nvim',
	},
	opts = function()
		local cmp = require('cmp')
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "NonText", default = true })

		local selectPrev = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
		local selectNext = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })

		local border = cmp.config.window.bordered({
			border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
			winhighlight = 'Normal:None,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None'
		})

		return {
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			-- enabled = function()
			-- 	if require"cmp.config.context".in_treesitter_capture("comment")==true or require"cmp.config.context".in_syntax_group("Comment") then
			-- 		return false
			-- 	else
			-- 		return true
			-- 	end
			-- end,
			-- preselect = false,
			view = {
				entries = { name = 'custom', selection_order = 'near_cursor' },
			},
			window = {
				documentation = border,
				completion = border
			},
			mapping = {
				["<Up>"] = selectPrev,
				["<S-Tab>"] = selectPrev,
				["<Down>"] = selectNext,
				["<Tab>"] = selectNext,
				-- ["<esc>"] = close without removeing typed text,
				["<S-space>"] = cmp.mapping.complete(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			},
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			-- formatting = {
			-- 	fields = { "abbr", "menu", "kind" },
			-- 	format = function(entry, vim_item)
			-- 		if vim.tbl_contains({ 'path' }, entry.source.name) then
			-- 			local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
			-- 			if icon then
			-- 				vim_item.kind = icon
			-- 				vim_item.kind_hl_group = hl_group
			-- 				return vim_item
			-- 			end
			-- 		end
			--
			-- 		local opts = {
			-- 			mode = 'symbol',
			-- 		}
			-- 		return require('lspkind').cmp_format(opts)(entry, vim_item)
			-- 	end
			-- },
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
				{ name = 'path' },
				{ name = 'luasnip' }
			},
			experimental = {
				ghost_text = {
					hl_group = "CmpGhostText",
				},
			},
		}
	end,
	config = function(_, opts)
		local cmp = require('cmp')

		-- local has_words_before = function()
		-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		-- end

		-- local moveDown = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	elseif has_words_before() then
		-- 		cmp.complete()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" })
		--
		-- local moveUp = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" })

		cmp.setup(opts)

		vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
			vim.lsp.handlers.hover,
			{border = 'single'}
		)

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			focusable = true,
			style = "minimal",
			border = "single",
		})

		-- insert () on function completion using autopairs
		cmp.event:on(
			'confirm_done',
			require('nvim-autopairs.completion.cmp').on_confirm_done()
		)
	end
}
