local lspservers = {
    qmlls = {}
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "qmljs" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        }
    }
}
