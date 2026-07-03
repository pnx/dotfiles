local spec = require('user.utils.lang_spec')

local lspservers = {
    qmlls = {}
}

return {
    spec.treesitter("qmljs"),
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        }
    }
}
