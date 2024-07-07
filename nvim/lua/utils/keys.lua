return function(v, opts)
    local c = vim.deepcopy(v)
    local lhs = table.remove(c, 1)
    local rhs = table.remove(c, 1)
    opts = vim.tbl_deep_extend("force", c, opts or {})

    local mode = 'n'
    if opts.mode  then
        mode = opts.mode
        opts.mode = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end
