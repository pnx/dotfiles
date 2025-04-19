local icons = require('user.icons')

return {
    'saghen/blink.cmp',
    lazy = false,
    version = "*",
    build = 'cargo build --release',
    dependencies = {
        { "xzbdmw/colorful-menu.nvim" },
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },
    opts = {
        keymap = {
            preset = "super-tab"
        },
        appearance = {
            nerd_font_variant = 'mono',
            kind_icons = icons.symbols
        },
        completion = {
            list = {
                selection = {
                    preselect = function(ctx) return ctx.mode ~= 'cmdline' end,
                    -- auto_insert = function(ctx) return ctx.mode ~= 'cmdline' end
                    auto_insert = false
                }
            },
            menu = {
                min_width = 18,
                winblend = 10,
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label", "source_name", gap = 1 },
                    },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                    },
                },
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
