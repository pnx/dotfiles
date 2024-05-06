return function(v, opts)
    local c = vim.deepcopy(v)
    local lhs = table.remove(c, 1)
    local rhs = table.remove(c, 1)
    opts = vim.tbl_deep_extend("force", c, opts or {})
    vim.keymap.set('n', lhs, rhs, opts)
end
