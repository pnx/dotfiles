local M = {}

M.keymaps = function(opts)
    opts = type(opts) == 'string' and require(opts) or opts
    vim.g.mapleader = opts.leader

    for _, v in ipairs(opts.global) do
        vim.keymap.set(unpack(v))
    end
end

return M
