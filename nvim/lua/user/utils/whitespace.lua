local M = {}

function M.Toggle()
    local indent = require "user.utils.indent_guidelines"
    if vim.opt.list._value then
        vim.opt.list = false
        indent.show(user.indentGuides)
    else
        vim.opt.list = true
        indent.show(false)
    end
end

return M
