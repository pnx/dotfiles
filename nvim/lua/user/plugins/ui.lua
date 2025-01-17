local ui = require("user.ui.telescope")

return {
    {
        'stevearc/dressing.nvim',
        opts = {
            input = {
                border = { " " },
                relative = "editor",
                title_pos = "center",
                mappings = {
                    n = {
                        ["<Esc>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },
                    i = {
                        ["<Esc>"] = "Close",
                        ["<CR>"] = "Confirm",
                        ["<Up>"] = "HistoryPrev",
                        ["<Down>"] = "HistoryNext",
                    },
                },
            },
            select = {
                backend = { "telescope" },
                telescope = require("telescope.themes").get_dropdown(ui.dropdown),
            }
        },
    },
    { import = "user.plugins.ui.statusline" },
    -- File explorer
    { import = "user.plugins.ui.neotree" },
    -- Nicer notifications
    {
        "j-hui/fidget.nvim",
        opts = {
            notification = {
                window = {
                    normal_hl = "Pmenu",
                    winblend = 5,
                    border = { " " }
                }
            },
            progress = {
                display = {
                    done_ttl = 2,
                }
            }
        }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    }
}
