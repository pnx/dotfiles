
local M = {}

-- Hack for making oil.nvim return to
-- the initial cwd on save.
function M.RegisterCWDHackHook()
    local cwd = vim.fn.getcwd()
    local group = vim.api.nvim_create_augroup("OilCWDHack", {})
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = group,
        pattern = "oil:///*",
        callback = function() vim.cmd("cd " .. cwd) end,
    })
end


return M
