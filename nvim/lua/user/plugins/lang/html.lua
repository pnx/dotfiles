local spec = require('user.utils.lang_spec')

return {
    spec.treesitter("html"),
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
