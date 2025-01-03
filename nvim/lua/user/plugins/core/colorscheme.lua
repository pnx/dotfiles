local options = {
    flavour = "mocha",
    transparent_background = true,
    color_overrides = {
        mocha = {
            base = "#0E1019",
            mantle = "#0D0F17",
            crust = "#0C0D14",
            surface0 = "#1a1c2d",
            surface1 = "#343959",
            surface2 = "#41476F",
            overlay0 = "#3F4256",
            overlay1 = "#5B5F7C",
            overlay2 = "#767BA0",
            text = "#eceef4",
        },
    },
    no_italic = true,
    no_bold = true,
    highlight_overrides = {
        mocha = function(colors)
            return {
                CursorLine = { bg = colors.surface0 },

                Visual = { bg = colors.surface1 },
                FoldColumn = { fg = colors.surface2 },

                -- Floating windows
                NormalFloat = { fg = colors.text, bg = colors.crust },
                FloatTitle = { fg = colors.base, bg = colors.blue },
                FloatBorder = { fg = colors.surface1, bg = colors.crust },

                -- Window separator
                WinSeparator = { fg = colors.surface0 },

                -- Menus
                Pmenu = { link = "NormalFloat" },
                PmenuSel = { bg = colors.surface2 },
                PmenuSbar = { link = "Pmenu" },
                PmenuThumb = { link = "PmenuSel" },

                -- NoiceMini = { link = "NormalFloat" },
                WhichKeyFloat = { link = "Pmenu" },

                -- indent lines
                IblScope = { fg = colors.surface0 },

                -- Search matches
                IncSearch = { bg = colors.yellow },

                -- Autocomplete window
                CmpItemAbbr = { fg = colors.overlay2 },
                CmpItemKindText = { fg = colors.text },

                -- CmpKind
                CmpItemKindBladeNav = { fg = "#f55247" },

                -- telescope
                TelescopeNormal = { link = "NormalFloat" },
                TelescopeBorder = { link = "FloatBorder" },
                TelescopeTitle = { link = "FloatTitle" },
                TelescopePromptNormal = { bg = colors.mantle },
                TelescopePromptPrefix = { fg = colors.mauve },
                TelescopePromptBorder = { fg = colors.mantle, bg = colors.mantle },
                TelescopePreviewTitle = { fg = colors.crust, bg = colors.mauve },
                TelescopeResultsNormal = { fg = colors.overlay2, bg = colors.crust },
                TelescopeMatching = { link = "CmpItemAbbrMatch" },
                TelescopeSelection = { fg = colors.text, bg = colors.surface1 },
                TelescopeIndicatorModified = { fg = colors.yellow },
                TelescopeIndicatorReadonly = { fg = colors.red },
                TelescopeIndicatorHidden = { link = "TelescopeResultsComment" },

                -- Ufo
                UfoFoldedEllipsis = { link = "Comment" },

                -- Statusline
                StatusLine = { fg = colors.text, bg = colors.crust },
                StatusLineNormal = { link = "StatusLine" },
                StatusLineSeparator = { fg = colors.rosewater, bg = colors.crust },
                StatusLineInsert = { fg = colors.base, bg = colors.blue },
                StatusLineVisual = { fg = colors.base, bg = colors.mauve },
                StatusLineCommand = { fg = colors.base, bg = colors.yellow },
                StatusLineReplace = { fg = colors.base, bg = colors.maroon },

                -- Neotree
                NeoTreeTabActive = { bg = colors.surface2, fg = colors.lavender },
                NeoTreeTabInactive = { bg = colors.crust, fg = colors.surface2 },
                NeoTreeTabSeparatorActive = { fg = colors.base, bg = colors.surface2 },
                NeoTreeTabSeparatorInactive = { fg = colors.base, bg = colors.crust },
                NeoTreeFileIcon = { link = "Normal" },
                NeoTreeModified = { fg = colors.yellow },
                NeoTreeWinSeparator = { link = "WinSeparator" },

                -- BlinkCmp
                BlinkCmpLabel = { link = 'CmpItemAbbr' },
                BlinkCmpLabelMatch = { link = 'CmpItemAbbrMatch' },
                BlinkCmpLabelDeprecated = { link = 'CmpItemAbbrDeprecated'},
                BlinkCmpLabelDetail = { link = 'CmpItemMenu' },
                BlinkCmpLabelDescription = { link = 'CmpItemMenu' },

                BlinkCmpSource = { link = 'CmpItemMenu' },
                BlinkCmpKind = { link = 'CmpItemKind' },
                BlinkCmpKindText = { link = "CmpItemKindText" },
                BlinkCmpKindMethod = { link = "CmpItemKindMethod" },
                BlinkCmpKindFunction = { link = "CmpItemKindFunction" },
                BlinkCmpKindConstructor = { link = "CmpItemKindConstructor" },
                BlinkCmpKindField = { link = "CmpItemKindField" },
                BlinkCmpKindVariable = { link = "CmpItemKindVariable" },
                BlinkCmpKindClass = { link = "CmpItemKindClass" },
                BlinkCmpKindInterface = { link = "CmpItemKindInterface" },
                BlinkCmpKindModule = { link = "CmpItemKindModule" },
                BlinkCmpKindProperty = { link = "CmpItemKindProperty" },
                BlinkCmpKindUnit = { link = "CmpItemKindUnit" },
                BlinkCmpKindValue = { link = "CmpItemKindValue" },
                BlinkCmpKindEnum = { link = "CmpItemKindEnum" },
                BlinkCmpKindKeyword = { link = "CmpItemKindKeyword" },
                BlinkCmpKindSnippet = { link = "CmpItemKindSnippet" },
                BlinkCmpKindColor = { link = "CmpItemKindColor" },
                BlinkCmpKindFile = { link = "CmpItemKindFile" },
                BlinkCmpKindReference = { link = "CmpItemKindReference" },
                BlinkCmpKindFolder = { link = "CmpItemKindFolder" },
                BlinkCmpKindEnumMember = { link = "CmpItemKindEnumMember" },
                BlinkCmpKindConstant = { link = "CmpItemKindConstant" },
                BlinkCmpKindStruct = { link = "CmpItemKindStruct" },
                BlinkCmpKindEvent = { link = "CmpItemKindEvent" },
                BlinkCmpKindOperator = { link = "CmpItemKindOperator" },
                BlinkCmpKindTypeParameter = { link = "CmpItemKindTypeParameter" },

                -- Neotest
                NeoTestWinSelect = { fg = colors.mauve },
                NeoTestIndent = { fg = colors.surface1 },
                NeoTestExpandMarker = { link = "NeoTestIndent" },
                NeoTestAdapterName = { fg = colors.mauve },
                NeoTestFile = { fg = colors.lavender },
                NeoTestDir = { fg = colors.blue },
                NeoTestTarget = { fg = colors.blue },
                NeoTestNamespace = { fg = colors.mauve },
                NeoTestPassed = { fg = colors.green },
                NeoTestFailed = { fg = colors.red },
                NeoTestSkipped = { fg = colors.blue },
                NeoTestRunning = { fg = colors.yellow },
                NeoTestWatching = { fg = colors.yellow },
                NeoTestMarked = { fg = colors.orange },

                -- Diagnostics
                DiagnosticUnderlineInfo = { style = {"undercurl"} },
                DiagnosticUnderlineHint = { style = {"undercurl"} },
                DiagnosticUnderlineWarn = { style = {"undercurl"} },
                DiagnosticUnderlineError = { style = {"undercurl"} },

                -- Markdown rendering
                RenderMarkdownCode = { bg = colors.crust },
                RenderMarkdownCodeInline = { fg = colors.rosewater, bg = colors.crust },

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
                Label = { link = "String" },
                String = { fg = colors.lavender },
                Exception = { link = "Keyword" },

                -- Treesitter tokens
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

                -- LSP
                ["@lsp.type.property"] = { link = "@variable" },
                ["@lsp.type.namespace.go"] = { fg = colors.rosewater },

                -- Bash
                ["@variable.parameter.bash"] = { fg = colors.rosewater },

                -- Makefile
                ["@function.make"] = { link = "Keyword" },
                ["@string.special.symbol.make"] = { link = "@variable" },

                -- Markup
                ["@markup.raw"] = { link = "@text" },
                ["@markup.strong"] = { fg = colors.blue },
                ["@markup.italic"] = { fg = colors.green },

                -- PHP
                ["@keyword.import.php"] = { link = "@keyword" },
                ["@class_name.php"] = { link = "@text" },
                ["@extend_name.php"] = { link = "@text" },
                ["@implement_name.php"] = { link = "@text" },
                ["@namespace_name.php"] = { link = "@text" },
                ["@namespace_alias.php"] = { link = "@text" },
                ["@function.builtin.php"] = { fg = colors.blue },

                -- Blade
                ["@tag.blade"] = { fg = colors.mauve },
            }
        end,
    },
    integrations = {
        cmp = true,
        treesitter = true,
        neotree = true,
        -- barbar = true,
        -- noice = true,
        telescope = {
            enabled = true,
        },
    }
}


return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = options,
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
