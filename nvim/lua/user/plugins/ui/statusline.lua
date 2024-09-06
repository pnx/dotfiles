local icons = require("user.icons")

local function indent_settings()
    return (vim.bo.expandtab and "SPC" or "TAB")
        .. " "
        .. (vim.bo.shiftwidth == 0 and vim.bo.tabstop or vim.bo.shiftwidth)
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
			-- section_separators = { "'" .. icons.separator .. "'", color = "StatusLineSeparator" },
			section_separators = "",
			disabled_filetypes = {
				statusline = {
					"dashboard",
				},
                winbar = {
                    "neo-tree",
                }
			},
            -- theme = "catppuccin"
			theme = {
				normal = {
					a = "StatusLineNormal",
					b = "StatusLine",
					c = "StatusLine",
					x = "StatusLine",
					y = "StatusLine",
					z = "StatusLine",
				},
				command = {
					a = "StatusLineCommand",
					z = "StatusLine",
				},
				insert = {
					a = "StatusLineInsert",
					z = "StatusLine",
				},
				visual = {
					a = "StatusLineVisual",
					z = "StatusLine",
				},
				replace = {
					a = "StatusLineReplace",
					z = "StatusLine",
				},
			},
		},
		sections = {
			lualine_a = {
			    {
                    "mode",
                    separator = "|"
                },
			},
			lualine_b = {
				{"branch"},
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
			},
			lualine_c = {
				{
					"filename",
					path = 1,
					symbols = vim.tbl_deep_extend("force", icons.file_status, {
                        unnamed = "",
                    })
				},
			},
			lualine_x = {
				"filetype",
				"fileformat",
				-- '(vim.bo.expandtab and "SPC" or "TAB") .. " " .. (vim.bo.shiftwidth == 0 and vim.bo.tabstop or vim.bo.shiftwidth)',
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
				"filename",
			},
		},
		inactive_winbar = {
			lualine_c = {
				{ "filetype", icon_only = true },
				"filename",
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
