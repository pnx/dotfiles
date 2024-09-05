local lspservers = {
    volar = {
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
        "neovim/nvim-lspconfig",
        ft = { "vue" },
        opts = {
            servers = lspservers
        },
    }
}
