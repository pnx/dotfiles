local icons = require('config.icons').diff_gutter

return {
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
    }
}
