local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    -- Test function
    s("tst", {
        t("func Test"), i(1, "Module"), t("_"), i(2, "Name"), t({"(t *testing.T) {", ""}),
        i(0),
        t({"", "}"})
    })
}

