local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local function capitalize_first(args)
    local str = args[1][1] or ""
    return str:gsub("^%l", string.upper)
end

return {
  s(
    "cvar",
    fmt([[
export const {}Variants = cva(
    '',
    {{
        variants: {{
            variant: {{
                default: "",
            }},
        }},
        defaultVariants: {{
            variant: 'default',
        }},
    }},
)

export type {}Variant = VariantProps<typeof {}Variants>
]], {
      i(1, "my"),
      f(capitalize_first, { 1 }),
      rep(1),
    })
  ),
}
