return {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { "markdown" },
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        {
            "nvim-treesitter/nvim-treesitter",
            opts = {
                ensure_installed = { "markdown" }
            }
        },
        {
            "windwp/nvim-ts-autotag",
            optional = true,
            opts = {
                filetypes = {
                    'markdown',
                },
            },
        },
    },
    opts = {
        latex = { enabled = false },
        code = {
            style = 'normal',
            min_width = 45,
            left_pad = 2,
            right_pad = 2,
            border = 'thick',
            above = ' ',
            below = ' ',
        },
    }
}
