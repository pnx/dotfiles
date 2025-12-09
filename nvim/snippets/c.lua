local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node

-- Helper: convert current filename to uppercase header guard
local function header_guard(_, snip)
    local name = snip.env.TM_FILENAME or "HEADER"
    -- Replace dots and non-alphanumerics with underscores
    name = name:gsub("%.", "_"):gsub("%W", "_"):upper()
    return name .. "_"
end

return {
    s("guard", {
        t("#ifndef "), f(header_guard, {}),
        t({ "", "#define " }), f(header_guard, {}),
        t({ "", "", "" }),
        i(0),
        t({ "", "", "#endif // " }), f(header_guard, {}),
    }),
}
