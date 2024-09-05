return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "c", "cpp" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        ft = { "c", "h", "cpp", "hpp" },
        opts = {
            servers = {
                clangd = {}
            }
        },
    }
}
