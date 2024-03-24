return {
	flavour = "mocha",
	color_overrides = {
		mocha = {
			base = '#0e1019',
			mantle = '#131521',
			text = '#eceef4',
		}
	},
	no_italic = true,
	no_bold = true,
	highlight_overrides = {
		mocha = function(colors)
			return {
				CursorLine = { bg = colors.mantle },

				-- indent lines
				IblScope = { fg = colors.overlay2 },

				BufferCurrent = { fg = colors.text, bg = colors.base },
				BufferCurrentMod = { fg = colors.yellow, bg = colors.base },
				BufferCurrentADDED = { fg = colors.green, bg = colors.base },
				BufferCurrentCHANGED = { fg = colors.yellow, bg = colors.base },
				BufferCurrentDELETED = { fg = colors.red, bg = colors.base },

				-- LSP
				LspReferenceText = { bg = colors.surface0 },
				LspReferenceRead = { link = "LspReferenceText" },
				LspReferenceWrite = { link = "LspReferenceText" },

				-- Syntax
				PreProc = { link = "Include" },
				Operator = { fg = colors.rosewater },
				Function = { link = "@text" },
				Delimiter = { link = "@text" },
				Include = { fg = colors.mauve },
				Keyword = { fg = colors.yellow },
				Repeat = { link = "Keyword" },
				Conditional = { link = "Keyword" },
				Type = { fg = colors.blue },
				String = { fg = colors.lavender },
				Exception = { link = "Keyword" },
				["@constructor"] = { link = "Function" },
				["@variable"] = { fg = colors.green },
				["@variable.builtin"] = { link = "@variable" },
				["@variable.parameter"] = { link = "@parameter" },
				["@variable.member"] = { link = "@variable" },
				["@parameter"] = { link = "@variable" },
				["@keyword.function"] = { link = "Keyword" },
				["@keyword.return"] = { link = "Keyword" },
				["@keyword.operator"] = { link = "Keyword" },
				["@property"] = { link = "@variable" },
				["@tag"] = { link = "Keyword" },
				["@tag.delimiter"] = { link = "@text" },
				["@punctuation"] = { link = "@text" },
				["@module"] = { link = "@text" },
				["@punctuation.bracket"] = { link = "@punctuation" },
				["@lsp.type.property"] = { link = "@variable" },

				-- PHP specific
				["@class_name.php"] = { link = "@text" },
				["@extend_name.php"] = { link = "@text" },
				["@implements_name.php"] = { link = "@text" },
				["@namespace_name.php"] = { link = "@text" },
				["@namespace_alias.php"] = { link = "@text" },
			}
		end
	},
	integrations = {
		cmp = true,
		treesitter = true,
		barbar = true,
		neotree = true,
		noice = true,
		telescope = {
			enabled = true,
		}
	}
}
