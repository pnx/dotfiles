
local M = {}

---@param width number?
function M.setHardtabs(width)
    width = width or 8
    vim.cmd(string.format("setlocal noet ts=%s sts=0 sw=0", width))
end

---@param width number
---@param isLocal boolean?
function M.setSofttabs(width, isLocal)
    isLocal = isLocal or false
    vim.cmd(string.format("set%s et ts=%s sts=0 sw=%s",
        isLocal and "local" or "", width, width))
end

return M
