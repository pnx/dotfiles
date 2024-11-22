
local icons = require("user.icons")

return vim.tbl_deep_extend("force", icons.symbols, {
    BladeNav = icons.filetypes.laravel,
})
