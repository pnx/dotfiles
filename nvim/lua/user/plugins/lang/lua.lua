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
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            install = { "lua" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        }
    }
}
