local spec = require('user.utils.lang_spec')

return {
    spec.treesitter("bash"),
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                bashls = {}
            }
        },
    }
}
