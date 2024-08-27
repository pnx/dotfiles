return {
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
    -- File explorer
    { import = "user.plugins.ui.neotree" },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    }
}
