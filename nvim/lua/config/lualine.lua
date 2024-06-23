local icons = require("config.icons")
local separator = { "'" .. icons.separator .. "'", color = "StatusLineSeparator" }

return {
	options = {
		globalstatus = true,
		component_separators = "",
		section_separators = "",
		disabled_filetypes = {
			statusline = {
				"dashboard",
			},
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
			"mode",
		},
		lualine_b = {
			separator,
			"branch",
			separator,
			'" " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
			{
				require("lazy.status").updates,
				cond = require("lazy.status").has_updates,
				color = { fg = "#ff9e64" },
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
			separator,
		},
		lualine_c = {
			{
				"filename",
				path = 1,
				symbols = {
					modified = "+",
					readonly = "[R]",
					unnamed = "-",
					newfile = "[New]",
				},
			},
		},
		lualine_x = {
			"filetype",
			"fileformat",
			'(vim.bo.expandtab and "SPC" or "TAB") .. " " .. vim.bo.shiftwidth',
		},
		lualine_y = {
			separator,
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
}
