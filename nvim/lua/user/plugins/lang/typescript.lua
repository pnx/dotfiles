local lspservers = {
    ts_ls = {},
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
        ft = { "ts" },
        opts = {
            servers = lspservers
        },
    }
}
