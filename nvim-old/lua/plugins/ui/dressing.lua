return {
    'stevearc/dressing.nvim',
    opts = {
        input = {
            title_pos = "center",
            border = "single",
            relative = "win",
        },
        select = {
            backend = { "telescope", "builtin" },
            telescope = require('telescope.themes').get_dropdown({
                borderchars = {
                    prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                },
                max_height = 5
            }),
            builtin = {
                border = "single",
            }
        }
    },
}
