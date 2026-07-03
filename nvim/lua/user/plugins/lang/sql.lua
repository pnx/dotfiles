local spec = require('user.utils.lang_spec')

local lspservers = {
    sqlls = {}
}

return {
    spec.treesitter("sql"),
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        },
    }
}
