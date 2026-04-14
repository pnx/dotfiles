return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            install = { "bash" }
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
