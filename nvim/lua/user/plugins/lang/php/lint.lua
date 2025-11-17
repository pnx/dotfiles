
return {
    -- 'mfussenegger/nvim-lint',
    -- optional = true,
    -- opts = {
    --     linters = {
    --         phpstan = {
    --             args = {
    --                 "analyze",
    --                 '--error-format=json',
    --                 '--no-progress',
    --             }
    --         }
    --     },
    --     linters_by_ft = {
    --         php = { 'phpstan' },
    --     },
    -- },
    -- config = function (_, opts)
    --     local lint = require('lint')
    --     lint.linters_by_ft = opts.linters_by_ft or {}
    --     lint.linters.phpstan.args = opts.linters.phpstan.args
    --
    --     vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    --         callback = function()
    --             require('lint').try_lint()
    --         end,
    --     })
    -- end
}
