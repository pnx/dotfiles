
---@param text string
---@param width number
---@param ellipsis string
---@return string
local function format_fixed_length(text, width, ellipsis)
    text = text or ""

    if width < 1 then
        return text
    end

    local len = vim.fn.strdisplaywidth(text)
    if text and len > width then
        text = vim.fn.strcharpart(text, 0, width - vim.fn.strdisplaywidth(ellipsis)) .. ellipsis
    elseif width > 0 then
        text = text .. string.rep(' ', width - len)
    end

    return text
end

---@param entry any
---@param kind any
---@param map any
---@return {icon: string, hl_group: string}|string
local function get_icon(entry, kind, map)
    if vim.tbl_contains({ 'path' }, entry.source.name) then
        local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
        if icon then
            return {
                icon = icon,
                hl_group = hl_group
            }
        end
    end

    if entry.source.name == "snippet" then
        return map["Snippet"] or "Snippet"
    end

    if entry.source.name == "spell" then
        return map["Spell"] or "Spell"
    end

    return map[kind] or "?"
end

return function (opts)
    return function(entry, item)
        local icon = get_icon(entry, item.kind, opts.symbol_map)

        if type(icon) == "table" then
            item.kind = icon.icon
            item.kind_hl_group = icon.hl_group
        else
            item.kind = icon
        end

        local widths = {
            abbr = opts.widths and opts.widths.abbr or 20,
            menu = opts.widths and opts.widths.menu or 15,
        }

        local ellipsis = opts.ellipsis or '...'
        for key, width in pairs(widths) do
            item[key] = format_fixed_length(item[key], width, ellipsis)
        end

        return item
    end
end
