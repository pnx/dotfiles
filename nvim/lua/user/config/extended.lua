---@class EditorYankOptions
---@field enable boolean
---@field higroup string
---@field timeout number

---@class EditorOptions
---@field highlight_yank EditorYankOptions

---@class ExtendedOptions
---@field editor EditorOptions
return {
    editor = {
        highlight_yank = {
            enable = true,
            timeout = 400,
            higroup = "IncSearch"
        }
    }
}
