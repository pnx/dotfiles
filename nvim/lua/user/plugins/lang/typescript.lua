local lspservers = {
    ts_ls = {},
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "typescript" }
        }
    },
    {
        "windwp/nvim-ts-autotag",
        optional = true,
        opts = {
            filetypes = {
                'javascript',
                'typescript',
                'tsx',
                'jsx'
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        ft = { "ts" },
        opts = {
            servers = lspservers
        },
    }
}
