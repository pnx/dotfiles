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
			blue = '#8ac6f2',
			cyan = '#8abeb7',
			purple = '#9999cc'
		},
		highlights = {
			["@string"] = { fg = "$purple" },
			["@function"] = { fg = "$fg" },
			["@keyword"] = { fg = "$yellow" },
			["@variable.parameter"] = { fg = "$fg" },
			["@punctuation.delimiter"] = { fg = "$fg" },
			["@punctuation.bracket"] = { fg = "$fg" }
		}
	},
    config = function(_, opts)
		local c = require('onedark')
		c.setup(opts)
		c.load()
	end
}
