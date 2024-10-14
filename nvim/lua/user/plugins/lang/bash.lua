return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "bash" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                bashls = {}
            }
        },
    }
}
