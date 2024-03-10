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
			fg = '#ffffff',
			bg0 = '#282a33',
			bg1 = '#30323b',
			bg2 = '#24262f',
			bg3 = '#383a43',
			bg_d = "#1f2129",
			bg_blue = "#ff00ff",
			bg_yellow = "#f0d197",
			red = '#cc817f',
			green = '#7ccfaf',
			yellow = '#ffcc99',
			orange = '#ffcc99',
			blue = '#8ac6f2',
			cyan = '#8abeb7',
			purple = '#9999cc',
			dark_cyan = "#8abeb7",
			dark_red = "#cc817f",
			dark_yellow = "#ffcc99",
			dark_purple = "#9999cc",
		},
		highlights = {
			-- ColorColumn = { bg = "$bg2"},
			-- SignColumn = { bg = "$bg2"},
			-- LineNr = { fg = "$light_grey", bg = "$bg2" }
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
			["@tag.attribute"] = { fg = "$cyan" },
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
