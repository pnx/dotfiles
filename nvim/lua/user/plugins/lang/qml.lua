local lspservers = {
    qmlls = {}
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            install = { "qmljs" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        }
    }
}
