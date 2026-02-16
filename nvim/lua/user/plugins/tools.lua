return {
    { import = "user.plugins.tools.finder" },
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        cmd = "Mason",
    },
}
