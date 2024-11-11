local icons = require('user.icons').diff_gutter

return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "folke/which-key.nvim",
            optional = true,
            opts = {
                defaults = {
                    ["<leader>g"] = { name = "+git" },
                },
            },
        },
    },
    opts = {
        signs = {
            add          = { text = icons.add },
            delete       = { text = icons.delete },
            change       = { text = icons.change },
            untracked    = { text = icons.untracked },
            topdelete    = { text = icons.delete },
            changedelete = { text = icons.change },
        },
        signs_staged = {
            add          = { text = icons.add },
            delete       = { text = icons.delete },
            change       = { text = icons.change },
            topdelete    = { text = icons.delete },
            changedelete = { text = icons.change },
        },
        diff_opts = {
            internal = true
        },
        preview_config = {
            border = { " " },
        }
    },
}
