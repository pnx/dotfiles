local lspservers = {
    volar = {
        init_options = {
            vue = {
                hybridMode = true,
            },
        },
    },
    tsserver = {
        settings = {
            tsserver_plugins = {
                "@vue/typescript-plugin",
            },
        },
    },
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
        opts = {
            servers = lspservers
        },
    }
}
