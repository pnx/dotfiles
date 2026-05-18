return {
    {
        "mfussenegger/nvim-dap",
        optional = true,
        dependencies = {
            "leoluz/nvim-dap-go"
        }
    },
    {
        "leoluz/nvim-dap-go",
        optional = true,
        ft = "go",
        opts = {},
    }
}
