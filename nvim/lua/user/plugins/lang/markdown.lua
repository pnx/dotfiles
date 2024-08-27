return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        {
            "nvim-treesitter/nvim-treesitter",
            opts = {
                ensure_installed = { "markdown" }
            }
        }
    },
    opts = {
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
