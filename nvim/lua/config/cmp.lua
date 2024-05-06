return function()
    local cmp = require('cmp')
    local lspkind = require('utils.lspkind')
    local icons = require('config.icons')

    local selectPrev = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
    local selectNext = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })

    local windowstyle = {
        border = "none",
        winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
    }

    return {
        preselect = false,
        completion = {
            completeopt = "menuone,longest,noinsert,preview"
        },
        view = {
            entries = { name = 'custom', selection_order = 'near_cursor' },
        },
        window = {
            documentation = windowstyle,
            completion = windowstyle
        },
        mapping = {
            ["<Up>"] = selectPrev,
            ["<S-Tab>"] = selectPrev,
            ["<Down>"] = selectNext,
            ["<Tab>"] = selectNext,
            ["<C-c>"] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        formatting = {
            fields = { "abbr", "kind", "menu" },
            format = lspkind.format({
                mode = 'symbol',
                preset = 'codicons',
                symbol_map = icons.symbols,
                maxwidth = 40,
                ellipsis_char = "...",
            }),
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'path' },
            { name = 'luasnip' }
        },
        experimental = {
            ghost_text = {
                hl_group = "NonText",
            },
        },
    }
end
