local icons = require("user.icons")

local function indent_settings()
    return (vim.bo.expandtab and "SPC" or "TAB")
        .. " "
        .. (vim.bo.shiftwidth == 0 and vim.bo.tabstop or vim.bo.shiftwidth)
end

local function lsp_info()
    local num_clients = tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))
    return " " .. num_clients
end

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"arkav/lualine-lsp-progress",
		"nvim-tree/nvim-web-devicons",
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
				"branch",
				-- '" " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
                lsp_info,
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
