
local M = {}

function M.document_highlight(bufnr)
    local group = vim.api.nvim_create_augroup('lsp_document_highlight', { clear = false })
    vim.api.nvim_clear_autocmds({
        buffer = bufnr,
        group = group,
    })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = group,
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        group = group,
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
    })
end

function M.signature_help_on_hover(bufnr)
    local group = vim.api.nvim_create_augroup('lsp_hover', { clear = false })

    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = group,
        buffer = bufnr,
        callback = vim.lsp.buf.hover,
    })
end

function M.codelens(augroup, bufnr)
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
        group = augroup,
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
    })
end

return M
