local icons = require("user.icons")

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

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
        "nvim-tree/nvim-web-devicons",
        "pnx/lualine-lsp-status",
	},
	opts = {
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
	                   "alpha"
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
				{"branch"},
				{
					"diagnostics",
					symbols = {
						error = icons.diagnostics.error .. " ",
						warn = icons.diagnostics.warn .. " ",
						info = icons.diagnostics.info .. " ",
						hint = icons.diagnostics.hint .. " ",
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
                linter,
			},
            lualine_c = {},
            lualine_x = {
                {
                    "filetype",
                    cond = is_not_popup
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
            },
            lualine_y = {
                "location",
                "progress",
            },
			lualine_z = {},
		},
		winbar = {
            lualine_c = {
                { "filetype", icon_only = true },
                {
                    "filename",
                    cond = is_not_popup,
                    path = 1,
                    symbols = vim.tbl_deep_extend("force", icons.file_status, {
                        unnamed = "",
                    })
                },
            },
		},
        inactive_winbar = {
            lualine_c = {
                { "filetype", icon_only = true },
                {
                    "filename",
                    cond = is_not_popup,
                    path = 1,
                    symbols = vim.tbl_deep_extend("force", icons.file_status, {
                        unnamed = "",
                    })
                },
            },
        },
		extensions = {
			"lazy",
			"neo-tree",
		},
	},
    init = function ()
        -- disable mode in the command line, as its already shown in lualine
        vim.o.showmode = false
    end
}
