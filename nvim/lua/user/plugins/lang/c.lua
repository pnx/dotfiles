local spec = require('user.utils.lang_spec')

return {
    spec.treesitter("c", "cpp"),
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {}
            }
        },
    }
}
