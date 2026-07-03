local spec = require('user.utils.lang_spec')

local lspservers = {
    vue_ls = {
        init_options = {
            vue = {
                hybridMode = true,
            },
        },
    }
}


return {
    spec.treesitter("vue"),
    -- Vue needs typescript
    { import = "user.plugins.lang.typescript" },
    -- And most likely css/scss aswell.
    { import = "user.plugins.lang.css" },
    {
        "windwp/nvim-ts-autotag",
        optional = true,
        opts = {
            filetypes = {
                'vue',
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        },
    }
}
