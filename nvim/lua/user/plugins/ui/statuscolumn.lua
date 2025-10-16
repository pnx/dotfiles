local icons = require('user.icons')

local opts = function()
    local builtin = require("statuscol.builtin")
    return {
        -- Align current relative number to the right.
        relculright = true,
        ft_ignore = {
            'help',
            'alpha',
            'NvimTree',
            'dap-repl',
            'dapui_breakpoints',
            'dapui_stacks',
            'dapui_watches',
            'dapui_scopes',
            'dapui_console',
        },
        segments = {
            {
                click = "v:lua.ScSa",
                sign = {
                    namespace = { "gitsigns" },
                    maxwidth = 1,
                    colwidth = 1,
                    foldclosed = true,
                }
            },
            {
                click = "v:lua.ScSa",
                sign = {
                    name = { ".*" },
                    namespace = { ".*" },
                    maxwidth = 1,
                    foldclosed = true,
                },
            },
            {
                text = { " ", builtin.lnumfunc, " " },
                click = "v:lua.ScLa",
            },
            {
                text = { builtin.foldfunc, " " },
                condition = { true, function (args) return args.fold.width > 0 end },
                click = "v:lua.ScFa"
            },
            {
                text = {
                    function(args)
                        local pos = vim.api.nvim_win_get_cursor(args.win)
                        return (args.lnum == pos[1] and "%#SignColumnSep#" or "")..icons.signcolum.separator
                    end,
                },
            },
        }
    }
end

-- Better status column
return {
    "luukvbaal/statuscol.nvim",
    event = { "BufReadPre", "BufNewFile", "BufAdd" },
    opts = opts
}

