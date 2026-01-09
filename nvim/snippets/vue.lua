local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("setup", {
        t({"<script setup lang=\"ts\">", ""}),
        i(0),
        t({"", "</script>"}),
    }),
    s("css", {
        t({"<style lang=\"css\">", ""}),
        i(0),
        t({"", "</style>"}),
    }),
}
