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
    -- Vue needs typescript
    { import = "user.plugins.lang.typescript" },
    -- And most likely css/scss aswell.
    { import = "user.plugins.lang.css" },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "vue" }
        }
    },
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
