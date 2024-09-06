return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "html" }
        }
    },
    {
        "windwp/nvim-ts-autotag",
        optional = true,
        opts = {
            filetypes = {
                'html',
            }
        }
    }
}
