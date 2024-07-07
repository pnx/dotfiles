
local M = {}

function M.all_files() require("telescope.builtin").find_files({no_ignore=true}) end

return M
