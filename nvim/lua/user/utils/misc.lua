
local M = {}

---@class HighlightYankConfig
---@field enable boolean
---@field timeout number
---@field higroup string

---@param opts HighlightYankConfig
M.highlight_yank = function(opts)
    vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("highlight_yank", {}),
        desc = "Hightlight selection on yank",
        pattern = "*",
        callback = function()
            vim.highlight.on_yank(opts)
        end,
    })
end

return M
