local M = {}

M.treesitter = function (...)
    return {
        "romus204/tree-sitter-manager.nvim",
        opts = {
            ensure_installed = {...},
        }
    }
end

M.treesitter_alias = function (value)
    return {
        "romus204/tree-sitter-manager.nvim",
        opts = {
            alias = value,
        }
    }
end

return M

