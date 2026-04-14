return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            install = { "css", "scss" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                tailwindcss = {},
            }
        },
    }
}
