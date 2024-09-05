return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "css", "scss" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        ft = { "css", "scss" },
        opts = {
            servers = {
                tailwindcss = {},
            }
        },
    }
}
