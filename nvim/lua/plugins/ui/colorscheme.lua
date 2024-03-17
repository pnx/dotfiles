return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
	opts = {
		style = 'darker',
		code_style = {
			comments = 'none',
			keywords = 'none',
			functions = 'none',
			strings = 'none',
			variables = 'none'
		},
		colors = {
			fg = '#b3b1b1',
			bg0 = '#171b26',
			bg1 = '#30323b',
			bg2 = '#24262f',
			bg3 = '#383a43',
			bg_d = "#1f2129",
			bg_blue = "#ff00ff",
			bg_yellow = "#f0d197",
			red = '#cc4a33',
			green = '#51cc7f',
			yellow = '#ccaf33',
			orange = '#ccab1f',
			blue = '#3390cc',
			cyan = '#33ccb7',
			purple = '#9233cc',
			dark_cyan = "#8abeb7",
			dark_red = "#cc817f",
			dark_yellow = "#ffcc99",
			dark_purple = "#9999cc",
		},
		highlights = {
			LineNr = { fg = "$light_grey" },
			CursorLineNr = { fg = "$blue" },

			Pmenu = { bg = "$bg2"},
			PmenuSel = { bg = "$bg_d", fg = "$fg" },
			FloatBorder = { fg = "$grey", bg = 'None' },
			-- Syntax
			["@comment"] = { fg = "$red" },
			["@string"] = { fg = "$purple" },
			["@function"] = { fg = "$fg" },
			["@keyword"] = { fg = "$yellow" },
			["@keyword.import"] = { fg = "$yellow" },
			["@keyword.function"] = { fg = "$yellow" },
			["@keyword.conditional"] = { fg = "$yellow" },
			["@keyword.operator"] = { fg = "$yellow" },
			["@keyword.repeat"] = { fg = "$yellow" },
			["@constant"] = { fg = "$green" },
			["@tag"] = { fg = "$yellow" },
			["@tag.delimiter"] = { fg = "$yellow" },
			["@tag.attribute"] = { fg = "$yellow" },
			["@type"] = { fg = "$blue" },
			["@type.qualifier"] = { fg = "$yellow" },
			["@type.definition"] = { fg = "$blue" },
			["@type.builtin"] = { fg = "$blue" },
			["@function.method"] = { fg = "$fg" },
			["@function.call"] = { fg = "$fg" },
			["@function.builtin"] = { fg = "$fg" },

			["@number"] = { fg = "$red" },
			["@variable"] = { fg = "$green" },
			["@variable.member"] = { fg = "$green" },
			["@variable.builtin"] = { fg = "$green" },
			["@variable.parameter"] = { fg = "$fg" },
			["@property"] = { fg = "$orange" },
		--	["@property"] = { fg = "$fg" },
			["@punctuation.delimiter"] = { fg = "$fg" },
			["@punctuation.bracket"] = { fg = "$fg" },
			["@module"] = { fg = "$fg" },

			-- php overrides
			["@class_name.php"] = { fg = "$fg" },
			["@extend_name.php"] = { fg = "$fg" },
			["@implements_name.php"] = { fg = "$fg" },
			["@namespace_name.php"] = { fg = "$fg" },
			["@namespace_alias.php"] = { fg = "$fg" },
		}
	},
    config = function(_, opts)
		local c = require('onedark')
		c.setup(opts)
		c.load()

		vim.cmd(string.format("highlight GitSignsAdd guifg='%s'", opts.colors.green))
		vim.cmd(string.format("highlight GitSignsChange guifg='%s'", opts.colors.yellow))
		vim.cmd(string.format("highlight GitSignsDelete guifg='%s'", opts.colors.red))
	end
}
