
--
-- This functions include plugins that adds editing functionality
-- to the editor in some way.
--

return {
    { import = "user.plugins.editor.treesitter" },
    -- Better folds
    { import = "user.plugins.editor.ufo" },

    -- Edit history
    { "mbbill/undotree", event = { "BufReadPre", "BufNewFile" } },

    -- Autopairs
    { 'echasnovski/mini.pairs', version = '*', opts = {}},

    -- Better text objects.
    { 'echasnovski/mini.ai', version = '*', opts = {}},

    -- Surround actions
    { "kylechui/nvim-surround", version = "^3.0.0", event = "VeryLazy", opts = {} },

    -- I use this for crc,crs,crm (etc) binds to change between cases.
    { 'tpope/vim-abolish' },

    -- {
    --     "pnx/mini.bufremove",
    --     opts = {
    --         empty_buf = "Alpha"
    --     },
    -- },
}
