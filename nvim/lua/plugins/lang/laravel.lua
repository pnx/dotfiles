return {
    "adalessa/laravel.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "tpope/vim-dotenv",
        "MunifTanjim/nui.nvim",
        "nvimtools/none-ls.nvim",
    },
    ft = "php",
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    config = function(_, _)
        local opts = require('config.plugins.laravel')

        local haswk, wk = pcall(require, "which-key")

        if haswk then
            wk.register({ l = { name = "laravel" } }, { prefix = "<leader>" })
        end

        for key, value in pairs(opts.keys) do
            vim.keymap.set("n", key, value[1], { desc = value[2] or '' })
        end

        require('laravel').setup(opts)
    end
}
