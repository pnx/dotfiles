local lspservers = {
    phpactor = {
        settings = {
            init_options = {
                ["language_server_phpstan.enabled"] = true,
                ["language_server_psalm.enabled"] = false,
            },
        },
    },
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "php", "phpdoc" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        },
    }
}
