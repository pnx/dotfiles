return {
    'kevinhwang91/nvim-ufo',
    event = "BufEnter",
    dependencies = {
        'kevinhwang91/promise-async',
    },
    opts = {
        close_fold_kinds_for_ft = {
            php = {'namespace_use_declaration'}
        },
        provider_selector = function(bufnr, filetype, buftype)
            _ = bufnr
            _ = filetype
            _ = buftype
            return {'treesitter', 'indent'}
        end
    }
}
