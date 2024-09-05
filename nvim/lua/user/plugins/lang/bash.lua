return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "bash" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        ft = { "sh" }, -- not all shell scripts is bash, but.
        opts = {
            servers = {
                bashls = {}
            }
        },
    }
}
