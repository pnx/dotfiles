local autocmd = vim.api.nvim_create_autocmd

-- Remove all trailing whitespaces on save
autocmd('BufWritePre', {
    command = [[:exe 'norm m`' | %s/\s\+$//eg | norm ``]]
})
