local icons = require("user.icons")

--
-- Helper functions
--

local function indent_settings()
    return (vim.bo.expandtab and "SPC" or "TAB")
        .. ":"
        .. (vim.bo.shiftwidth == 0 and vim.bo.tabstop or vim.bo.shiftwidth)
end

local function is_not_popup()
    local types = {
        "TelescopePrompt"
    }

    return not vim.tbl_contains(types, vim.bo.filetype)
end

local function linter()
    local ok, lint = pcall(require, "lint")
    if ok then
        local linters = lint.get_running()
        if #linters == 0 then
            return "󰦕"
        end
        return "󱉶 " .. table.concat(linters, ", ")
    end
    return "no linter"
end

--
-- Options
--

local options = {
    options = {
        globalstatus = true,
        component_separators = "",
        section_separators = "",
        disabled_filetypes = {
            statusline = {
                "dashboard",
                "alpha",
            },
            winbar = {
                "neo-tree",
                "NvimTree",
                "alpha",
                'dap-repl',
                'dapui_breakpoints',
                'dapui_stacks',
                'dapui_watches',
                'dapui_scopes',
                'dapui_console',
            }
        },
        theme = {
            normal = {
                a = "StatusLineNormal",
                b = "StatusLineLualine",
                c = "StatusLineLualine",
                x = "StatusLineLualine",
                y = "StatusLineLualine",
                z = "StatusLineLualine",
            },
            command = {
                a = "StatusLineCommand",
            },
            insert = {
                a = "StatusLineInsert",
            },
            visual = {
                a = "StatusLineVisual",
            },
            replace = {
                a = "StatusLineReplace",
            },
        },
    },
    sections = {
        lualine_a = {
            "mode",
        },
        lualine_b = {
            {"branch", icon = icons.vcs.branch },
            {
                "diagnostics",
                symbols = {
                    error = icons.diagnostics.error .. "  ",
                    warn = icons.diagnostics.warn .. "  ",
                    info = icons.diagnostics.info .. "  ",
                    hint = icons.diagnostics.hint .. "  ",
                },
            },
            {
                "diff",
                symbols = {
                    added = icons.diff.added .. " ",
                    modified = icons.diff.modified .. " ",
                    removed = icons.diff.removed .. " ",
                },
            },
            { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
            {
                "filename",
                cond = is_not_popup,
                path = 1,
                padding = { left = 0, right = 1 },
                symbols = vim.tbl_deep_extend("force", icons.file_status, {
                    unnamed = "",
                })
            },
        },
        lualine_c = {},
        lualine_x = {
            linter,
            {
                "lsp-status",
                disabled_filetypes = {
                    "TelescopePrompt",
                },
                on_click = function (_, btn, _)
                    if btn == "l" then
                        vim.cmd(":LspInfo")
                    elseif btn == "r" then
                        vim.cmd(":LspRestart")
                    end
                end
            },
            {
                "fileformat",
                symbols = {
                    unix = "NL",
                    dos = "NLCR",
                    mac = 'NL'
                }
            },
            indent_settings,
            "location",
        },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = {
        "lazy",
        "neo-tree",
    },
}

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
        "nvim-tree/nvim-web-devicons",
        "pnx/lualine-lsp-status",
	},
	opts = options,
    init = function ()
        -- disable mode in the command line, as its already shown in lualine
        vim.o.showmode = false
    end
}
