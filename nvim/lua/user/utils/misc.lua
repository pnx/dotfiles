
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

local gutter_settings = {
    savedStatusColumn = '',
    number = false,
    relnum = false,
    fold = ''
}

M.toggle_gutter = function()
    if vim.o.statuscolumn == "" then
        vim.o.statuscolumn = gutter_settings.savedStatusColumn
        vim.o.number = gutter_settings.number
        vim.o.relativenumber = gutter_settings.relnum
        vim.o.foldcolumn=gutter_settings.fold
    else
        gutter_settings.savedStatusColumn = vim.o.statuscolumn
        gutter_settings.number = vim.o.number
        gutter_settings.relnum = vim.o.relativenumber
        gutter_settings.fold = vim.o.foldcolumn
        vim.o.statuscolumn = ""
        vim.o.number = false
        vim.o.relativenumber = false
        vim.o.foldcolumn="0"
    end
end

return M
