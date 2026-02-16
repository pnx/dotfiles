
local M = {}

local basePath = vim.fn.stdpath("data") .. "/mason/bin/"

function M.binary(name)
    return basePath .. name
end

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
