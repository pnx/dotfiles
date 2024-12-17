local icons = require('user.icons')

return {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.*',
    build = 'cargo build --release',
    dependencies = {
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },
    opts = {
        keymap = { preset = 'enter' },
        appearance = {
            nerd_font_variant = 'mono',
            kind_icons = icons.symbols
        },
        sources = {
            default = { 'lsp', 'path', 'luasnip', 'buffer' },
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
                winblend = 5,
            },
            documentation = {
                auto_show = true,
                window = {
                    winblend = 5
                }
            },
            ghost_text = {
                enabled = true,
            }
        },
        signature = { enabled = true }
    }
}
