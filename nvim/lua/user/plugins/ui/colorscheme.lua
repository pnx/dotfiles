return {
    "https://codeberg.org/pnx/skift.nvim",
    lazy = false,
    priority = 999,
    opts = {
        bold = false,
        italic = false,
    },
    config = function(_, opts)
        require("skift").setup(opts)
        vim.cmd("colorscheme skift")
    end,
}
