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
}
