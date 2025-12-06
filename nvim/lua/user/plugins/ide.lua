
return {
    { import = "user.plugins.ide.lsp" },
    { import = "user.plugins.ide.autocomplete" },
    { import = "user.plugins.ide.formatting" },
    { import = "user.plugins.ide.test" },
    -- Linting
    {
        'mfussenegger/nvim-lint',
        opts = {
            linters_by_ft = {},
        },
        config = function(_, opts)
            require('lint').linters_by_ft = opts.linters_by_ft

            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        version = 'v2.*',
        lazy = true,
        build = "make install_jsregexp",
        -- dependencies = {
        --     {
        --         "rafamadriz/friendly-snippets",
        --         config = function()
        --             require("luasnip.loaders.from_vscode").lazy_load()
        --         end,
        --     },
        -- },
        opts = {},
        config = function(_, opts)
            require("luasnip.loaders.from_lua").load({
                paths = vim.fn.stdpath('config') .. vim.fs.normalize("/snippets")
            })
            require("luasnip").setup(opts)
        end,
    },
}
