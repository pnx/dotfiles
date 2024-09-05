return {
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
