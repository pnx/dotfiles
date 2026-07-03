local spec = require('user.utils.lang_spec')

local lspservers = {
    lua_ls = {
        settings = {
            Lua = {
                hint = {
                    arrayIndex = "Disable",
                    paramName = "Literal",
                },
                runtime = {
                    version = "LuaJIT",
                },
                workspace = {
                    checkThirdParty = false,
                },
            },
        },
    },
}

return {
    spec.treesitter("lua"),
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        }
    }
}
