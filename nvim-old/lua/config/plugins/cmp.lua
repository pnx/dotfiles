return function()
    local cmp = require('cmp')
    local lspkind = require('utils.lspkind')
    local icons = require('config.icons')

    local selectPrev = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
    local selectNext = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })

    local borderstyle = {
        border = "none",
        winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
    }

    return {
        preselect = false,
        view = {
            entries = { name = 'custom', selection_order = 'near_cursor' },
        },
        window = {
            documentation = borderstyle,
            completion = borderstyle
        },
        mapping = {
            ["<Up>"] = selectPrev,
            ["<S-Tab>"] = selectPrev,
            ["<Down>"] = selectNext,
            ["<Tab>"] = selectNext,
            ["<S-c>"] = cmp.mapping.abort(),
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
            { name = "copilot" },
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
