
local M = {}

function M.setHardtabs()
    -- vim.bo.expandtab = false
    -- vim.bo.tabstop = 8
    -- vim.bo.shiftwidth = 0
    -- vim.bo.softtabstop = 0
    vim.cmd([[setlocal noet ts=8 sts=0 sw=0]])
end

---@param width number
function M.setSofttabs(width, isLocal)
    isLocal = (isLocal or false) and "local" or ""
    vim.cmd(string.format("set%s et ts=%s sts=0 sw=%s", isLocal, width, width))
end

return M
