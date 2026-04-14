local lspservers = {
    sqlls = {}
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            install = { "sql" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        },
    }
}
