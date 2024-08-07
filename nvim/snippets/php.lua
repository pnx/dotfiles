local q = require('vim.treesitter.query')

local ls = require('luasnip')
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require('luasnip.util.events')
-- local ai = require('luasnip.nodes.absolute_indexer')
local fmt = require('luasnip.extras.fmt').fmt
-- local m = require('luasnip.extras').m
-- local lambda = require('luasnip.extras').l
local rep = require('luasnip.extras').rep
-- local postfix = require('luasnip.extras.postfix').postfix

local visibility_modifiers = {
    t('public'),
    t('private'),
    t('protected'),
}

local query_constructor_args = vim.treesitter.query.parse(
    'php',
    [[
    (method_declaration
    name: (name) @method_name (#eq? @method_name "__construct")
    parameters:
        (formal_parameters
            (simple_parameter name: (variable_name (name) @arg_name ))
        ))
    ]]
)

return {
    -- Class
    s(
        {
            trig = 'cl',
        },
        fmt(
            [[
            /**
             * {} {}
             *
             */

            {}

            class {} {{

                {}

                {} function __construct({}) {{
                    {}

                }}

            }}
        ]],
            {
                i(1, 'Class description'),
                i(2, 'Classname'),
                ---@diagnostic disable-next-line: unused-local
                f(function(args, snip, user_arg)
                    -- TODO: generate namespace using parent directories
                    return 'namespace ' .. args[1][1] .. ';'
                end, { 2 }),
                rep(2),
                ---@diagnostic disable-next-line: unused-local
                f(function(args, snip, user_arg)
                    local parser = vim.treesitter.get_parser(0, 'php')
                    local syntax_tree = parser:parse()
                    local root = syntax_tree[1]:root()

                    local text = ''
                    local fields = { '' }

                    for _, match, _ in query_constructor_args:iter_matches(root, 0) do
                        for id, node in pairs(match) do
                            local name = query_constructor_args.captures[id]
                            if name == 'arg_name' then
                                text = q.get_node_text(node, 0)
                                fields[#fields + 1] = 'private $_' .. text .. ';'
                            end
                        end
                    end
                    return fields
                end, 4),
                c(3, visibility_modifiers),
                i(4, '/* Constructor parameters */'),
                f(function()
                    local parser = vim.treesitter.get_parser(0, 'php')
                    local syntax_tree = parser:parse()
                    local root = syntax_tree[1]:root()

                    local text = ''
                    local fields = { '' }

                    for _, match, _ in query_constructor_args:iter_matches(root, 0) do
                        for id, node in pairs(match) do
                            local name = query_constructor_args.captures[id]
                            if name == 'arg_name' then
                                text = q.get_node_text(node, 0)
                                fields[#fields + 1] = '$this->_' .. text .. '= $' .. text .. ';'
                            end
                        end
                    end
                    return fields
                end, { 4 }),
            }
        )
    ),
    s(
        {
            trig = 'am',
        },
        fmt(
            [[
        Cacca
            ]],
            {}
        )
    ),
    s(
        {
            trig = 'af',
        },
        fmt(
            [[
        Cacca
            ]],
            {}
        )
    ),
    -- Getter Setter
    s(
        {
            trig = 'getset'
        },
        fmt([[
        public function get{}() : {} {{
            return {};
        }}
        public function set{}(${} {}) {{
            $this->{} = ${};
            return $this;
        }}
        ]], {
            i(1, 'Name'),
            i(2, 'Type'),
            rep(1), -- getter return type
            rep(1), -- getter return value
            rep(1), -- setter arg name
            rep(2), -- setter arg type
            rep(2), -- setter property
            rep(1), -- setter value
        })
    )
}, {}
