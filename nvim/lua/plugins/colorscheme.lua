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
			bg_d = "#1f2129",
			red = '#cc817f',
			green = '#7ccfaf',
			yellow = '#ffcc99',
			orange = '#ffcc99',
			blue = '#8ac6f2',
			cyan = '#8abeb7',
			purple = '#9999cc'
		},
		highlights = {
			["@string"] = { fg = "$purple" },
			["@function"] = { fg = "$fg" },
			["@keyword"] = { fg = "$yellow" },
			["@keyword.import"] = { fg = "$yellow" },
			["@keyword.function"] = { fg = "$yellow" },
			["@keyword.conditional"] = { fg = "$yellow" },
			["@keyword.operator"] = { fg = "$yellow" },
			["@type"] = { fg = "$blue" },
			["@type.qualifier"] = { fg = "$yellow" },
			["@type.definition"] = { fg = "$blue" },
			["@type.builtin"] = { fg = "$blue" },
			["@function.method"] = { fg = "$fg" },
			["@number"] = { fg = "$red" },
			["@variable"] = { fg = "$green" },
			["@variable.builtin"] = { fg = "$green" },
			["@variable.parameter"] = { fg = "$fg" },
			["@property"] = { fg = "$green" },
			["@punctuation.delimiter"] = { fg = "$fg" },
			["@punctuation.bracket"] = { fg = "$fg" },
			["@module"] = { fg = "$fg" },
		}
	},
    config = function(_, opts)
		local c = require('onedark')
		c.setup(opts)
		c.load()
	end
}
