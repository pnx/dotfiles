local lspservers = {
    lua_ls = {
        cmd = { "/opt/luals/bin/lua-language-server", "--logpath=~/.local/luals/logs" },
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME,
                    },
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
        ft = { "lua" },
        opts = {
            servers = lspservers
        }
    }
}
