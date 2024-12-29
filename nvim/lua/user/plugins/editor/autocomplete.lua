local icons = require('user.icons')

return {
    'saghen/blink.cmp',
    lazy = false,
    build = 'cargo build --release',
    dependencies = {
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },
    opts = {
        keymap = {
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.accept()
                    else
                        return cmp.select_prev()
                    end
                end,
                'snippet_backward',
                'fallback'
            },

            ['<Tab>'] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.accept()
                    else
                        return cmp.select_next()
                    end
                end,
                'snippet_forward',
                'fallback'
            },
            ['<CR>'] = { 'accept', 'fallback' },
        },
        appearance = {
            nerd_font_variant = 'mono',
            kind_icons = icons.symbols
        },
        sources = {
            default = function(_)
                local success, node = pcall(vim.treesitter.get_node)
                if success and node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
                    return { 'buffer' }
                else
                    return { 'lsp', 'path', 'luasnip', 'buffer' }
                end
            end
        },
        snippets = {
            expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
            active = function(filter)
                if filter and filter.direction then
                    return require('luasnip').jumpable(filter.direction)
                end
                return require('luasnip').in_snippet()
            end,
            jump = function(direction) require('luasnip').jump(direction) end,
        },
        completion = {
            menu = {
                min_width = 18,
                winblend = 10,
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label",    "label_description", "source_name", gap = 1 },
                    },
                }
            },
            documentation = {
                auto_show = true,
                window = {
                    winblend = 10
                }
            },
            ghost_text = {
                enabled = true,
            }
        },
        signature = {
            enabled = true,
            window = {
                scrollbar = false,
                winblend = 10,
            }
        }
    }
}
