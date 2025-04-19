return {
    { import = "user.plugins.tools.finder" },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = "Mason",
        opts_extend = { "ensure_installed" },
        opts = {},
        config = function(_, opts)
            require("mason").setup(opts)
        end
    },
}
