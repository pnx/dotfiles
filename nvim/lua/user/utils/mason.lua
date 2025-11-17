
local M = {}

function M.ensure_installed(names)
    return {
        "mason-org/mason.nvim",
        optional = true,
        opts = {
            ensure_installed = { names }
        }
    }
end

return M
