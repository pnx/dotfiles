
local M = {}

function M.delimiter()
    if vim.fn.has('win32') then
        return '\\'
    end
    return '/'
end

return M
