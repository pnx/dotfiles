local ls = require('luasnip')

local s = ls.snippet
local f = ls.function_node

ls.add_snippets("all", {
    s("daterfc5322", { f(function() return os.date("%a, %d %b %Y %H:%M:%S %z") end) })
})

