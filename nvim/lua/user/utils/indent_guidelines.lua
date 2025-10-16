
local M = {}

function M.toggle()
    user.indentGuides = not user.indentGuides
    M.show(user.indentGuides)
end

---@param value boolean
function M.show(value)
    local has_ibl, ibl = pcall(require, "ibl")
    if has_ibl then
        ibl.update { enabled = value }
    end
end

return M
