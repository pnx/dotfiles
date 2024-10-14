return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "c", "cpp" }
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
