local lspservers = {
    lua_ls = {
        settings = {
            Lua = {
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
            ensure_installed = { "lua" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        }
    }
}
