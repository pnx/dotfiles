return function()
	local cmp = require("cmp")
	local utils = require("utils.cmd")
	local luasnip = require("luasnip")
	local lspkind = require("utils.lspkind")
	local icons = require("config.icons")

	local selectPrev = utils.selectPrev({ behavior = cmp.SelectBehavior.Insert })
	local selectNext = utils.selectNext({ behavior = cmp.SelectBehavior.Insert })

	local windowstyle = {
		border = vim.g.float_border or "none",
		winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
	}

	return {
		preselect = false,
		completion = {
			completeopt = "menuone,longest,noinsert,preview",
		},
		view = {
			entries = { name = "custom", selection_order = "near_cursor" },
		},
		window = {
			documentation = windowstyle,
			completion = vim.tbl_deep_extend("force", windowstyle, {
				scrolloff = 4,
			}),
		},
		mapping = {
			["<Up>"] = selectPrev,
			["<S-Tab>"] = selectPrev,
			["<Down>"] = selectNext,
			["<Tab>"] = selectNext,
			["<C-c>"] = cmp.mapping.abort(),
			["<CR>"] = utils.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = lspkind.format({
				mode = "symbol",
				preset = "codicons",
				symbol_map = icons.symbols,
				maxwidth = 40,
				ellipsis_char = "...",
			}),
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
			{
				name = "spell",
				option = {
					keep_all_entries = false,
					enable_in_context = function()
						return true
					end,
					preselect_correct_word = true,
				},
			},
		},
		-- experimental = {
		-- 	ghost_text = {
		-- 		hl_group = "NonText",
		-- 	},
		-- },
	}
end
