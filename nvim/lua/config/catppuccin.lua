return {
	flavour = "mocha",
	color_overrides = {
		mocha = {
			base = '#0E1019',
			mantle = '#131521',
			text = '#ECEEF4',
		}
	},
	highlight_overrides = {
		mocha = function(colors)
			return {
				CursorLine = { bg = colors.mantle },

				-- indent lines
				IblScope = { fg = colors.overlay2 },

				BufferCurrent = { fg = colors.text, bg = colors.base },
				-- BufferInactive = { bg=colors.base},
				-- BufferOffset = { bg = colors.mantle },
				-- BufferTabpageFill = {bg=colors.base},
				-- Bufferbar

				-- Syntax
				Operator = { link = "@text" },
				Function = { link = "@text" },
				Delimiter = { link = "@text" },
				Include = { fg = colors.yellow },
				Keyword = { fg = colors.yellow },
				Repeat = { link = "Keyword" },
				Conditional = { link = "Keyword" },
				Type = { fg = colors.blue },
				String = { fg = colors.lavender },
				["@constructor"] = { link = "Function" },
				["@variable"] = { fg = colors.green },
				["@variable.builtin"] = { link = "@variable" },
				["@variable.parameter"] = { link = "@variable" },
				["@variable.member"] = { link = "@variable" },
				["@keyword.function"] = { link = "Keyword" },
				["@keyword.return"] = { link = "Keyword" },
				["@property"] = { link = "@variable" },
				["@tag"] = { link = "Keyword" },
				["@tag.delimiter"] = { link = "@text" },
				["@punctuation"] = { link = "@text" },
				["@punctuation.bracket"] = { link = "@punctuation" },
				["@lsp.type.property"] = { link = "@variable" },
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
