local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("ternary", {
        i(1, "cond"), t(" ? "), i(2, "true"), t(" : "), i(3, "false")
    })
}

