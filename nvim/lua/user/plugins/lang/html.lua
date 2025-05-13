return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "html" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                html = {
                    filetypes = {"html", "templ", "blade" }
                }
            }
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
