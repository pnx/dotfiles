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
        heading = {
            position = 'inline',
            left_pad = 1,
            right_pad = 1,
        },
        code = {
            style = 'full',
            language_pad = 1,
            min_width = 45,
            left_pad = 2,
            right_pad = 2,
            border = 'thick',
        },
    }
}
