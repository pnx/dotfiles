local lspservers = {
    rust_analyzer = {
        -- settings = {
        --     ["rust-analyzer"] = {
        --         imports = {
        --             granularity = {
        --                 group = "module",
        --             },
        --             prefix = "self",
        --         },
        --         cargo = {
        --             buildScripts = {
        --                 enable = true,
        --             },
        --         },
        --         procMacro = {
        --             enable = true
        --         },
        --     }
        -- }
    }
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "rust", "toml" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        ft = { "rust" },
        opts = {
            servers = lspservers
        },
    }
}
