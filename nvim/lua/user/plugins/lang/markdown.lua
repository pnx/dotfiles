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
        completions = {
            lsp = { enabled = true },
            blink = { enabled = true }
        },
        heading = {
            position = 'inline',
            left_pad = 1,
            right_pad = 1,
        },
        code = {
            style = 'full',
            sign = false,
            language_pad = 1,
            left_pad = 2,
            right_pad = 2,
            border = 'thin',
        },
        overrides = {
            buftype = {
                nofile = {
                    render_modes = true,
                    padding = { highlight = 'NormalFloat' },
                    sign = { enabled = false },
                    code = { style = "normal", border = 'hide', left_pad = 1, right_pad = 1 },
                    paragraph = { left_margin = 1 },
                },
            },
        },
    }
}
