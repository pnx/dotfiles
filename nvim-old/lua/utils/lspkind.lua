
local M = {}

-- Create format function.
function M.format(config)
    return function(entry, vim_item)
        -- Devicons for files
        if vim.tbl_contains({ 'path' }, entry.source.name) then
            local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
            if icon then
                vim_item.kind = icon
                vim_item.kind_hl_group = hl_group
                return vim_item
            end
        end

        return require('lspkind').cmp_format(config)(entry, vim_item)
    end
end

return M
