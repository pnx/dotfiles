return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            install = { "c", "cpp" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {}
            }
        },
    }
}
