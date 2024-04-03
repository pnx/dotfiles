return {
	flavour = "mocha",
	color_overrides = {
		mocha = {
			base = '#0e1019',
			mantle = '#0D0F17',
			crust = '#0C0D14',
			surface0 = '#131521',
			surface1 = '#343959',
			surface2 = '#41476F',
			overlay0 = '#3F4256',
			overlay1 = '#5B5F7C',
			overlay2 = '#767BA0',
			text = '#eceef4',
		}
	},
	no_italic = true,
	no_bold = true,
	highlight_overrides = {
		mocha = function(colors)
			return {
				NormalFloat = { bg = colors.crust },
				FloatBorder = { fg = colors.crust, bg = colors.crust },
				WinSeparator = { fg = colors.surface0 },

				NoiceMini = { bg = colors.crust },

				-- indent lines
				IblScope = { fg = colors.overlay1 },


				-- LSP
				-- LspReferenceText = { bg = colors.surface0 },
				-- LspReferenceRead = { link = "LspReferenceText" },
				-- LspReferenceWrite = { link = "LspReferenceText" },
				--
				-- -- telescope
				TelescopeNormal = { bg = colors.crust },
				TelescopeBorder = { fg = colors.crust, bg = colors.crust },
				TelescopePromptNormal = { bg = colors.mantle },
				TelescopePromptPrefix = { fg = colors.mauve },
				TelescopePromptBorder = { fg = colors.mantle, bg = colors.mantle },
				TelescopePromptTitle = { fg = colors.crust, bg = colors.blue },
				TelescopePreviewTitle = { fg = colors.crust, bg = colors.mauve },

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
