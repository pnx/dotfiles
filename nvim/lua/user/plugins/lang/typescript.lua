local lspservers = {
    tsserver = {
        settings = {
            -- tsserver_plugins = {
            --     "@vue/typescript-plugin",
            -- },
        },
    },
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "typescript" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        },
    }
}
