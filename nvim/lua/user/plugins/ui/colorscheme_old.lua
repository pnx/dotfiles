
local custom_highlights = function(colors)
    return {
        CursorLine = { bg = colors.surface0 },
        SignColumnSep = { bg = colors.surface0, fg = colors.surface1 },

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
        IblIndent = { link = "NonText" },

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
        TelescopeResultsNormal = { fg = colors.text, bg = colors.crust },
        TelescopeResultsClass = { link = "CmpItemKindClass" },
        TelescopeResultsInterface = { link = "CmpItemKindInterface" },
        TelescopeResultsField = { link = "CmpItemKindField" },
        TelescopeResultsFunction = { link = "CmpItemKindFunction" },
        TelescopeResultsMethod = { link = "CmpItemKindMethod" },
        TelescopeResultsNumber = { link = "CmpItemKindNumber" },
        TelescopeResultsStruct = { link = "CmpItemKindStruct" },
        TelescopeResultsConstant = { link = "CmpItemKindConstant" },
        TelescopeResultsOperator = { link = "CmpItemKindOperator" },
        TelescopeResultsVariable = { link = "CmpItemKindVariable" },
        TelescopeResultsIdentifier = { link = "CmpItemKindIdentifier" },
        TelescopeMatching = { fg = colors.lavender },
        TelescopeSelection = { fg = colors.text, bg = colors.surface1 },
        TelescopeIndicatorModified = { fg = colors.yellow },
        TelescopeIndicatorReadonly = { fg = colors.red },
        TelescopeIndicatorHidden = { link = "TelescopeResultsComment" },

        -- Ufo
        UfoFoldedEllipsis = { link = "Comment" },

        -- Statusline

        -- Something resets StatusLine highlight background, so use another one for now :)
        -- StatusLine = { fg = colors.text, bg = colors.crust },
        StatusLineLualine = { fg = colors.text, bg = colors.crust },

        StatusLineNormal = { link = "StatusLineLualine" },
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

        -- NvimTree
        NvimTreeNormal = { bg = colors.mantle },
        NvimTreeWinSeparator = { bg = colors.mantle, fg = colors.surface2 },
        NvimTreeOpenedFile = { fg = colors.lavender },
        NvimTreeSpecialFile = { fg = colors.peach },
        NvimTreeGitStaged = { fg = colors.green },
        NvimTreeGitDirty = { fg = colors.yellow },

        -- BlinkCmp
        BlinkCmpLabel = { link = 'CmpItemAbbr' },
        BlinkCmpLabelMatch = { link = 'CmpItemAbbrMatch' },
        BlinkCmpLabelDeprecated = { link = 'CmpItemAbbrDeprecated' },
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

        -- DAP
        DapStopped = { fg = colors.yellow },

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
        DiagnosticUnderlineInfo = { style = { "undercurl" } },
        DiagnosticUnderlineHint = { style = { "undercurl" } },
        DiagnosticUnderlineWarn = { style = { "undercurl" } },
        DiagnosticUnderlineError = { style = { "undercurl" } },

        -- Markdown rendering
        RenderMarkdownCode = { bg = colors.crust },
        RenderMarkdownCodeInline = { fg = colors.rosewater, bg = colors.crust },

        -- todo comments
        TodoCommentsDefault = { fg = colors.flamingo },
        TodoCommentsInfo = { fg = colors.blue },
        TodoCommentsError = { fg = colors.maroon },
        TodoCommentsWarning = { fg = colors.peach },
        TodoCommentsHint = { fg = colors.sapphire },
        TodoCommentsTest = { fg = colors.pink },

        -- Text
        NonText = { fg = colors.surface0 },
        TextMute = { fg = colors.overlay2 },
        Whitespace = { link = "NonText" },

        --
        -- Syntax - Base
        --
        PreProc = { fg = colors.mauve },
        Macro = { link = "PreProc" },
        Identifier = { fg = colors.pink },
        Variable = { fg = colors.green },
        Number = { fg = colors.maroon },
        Float = { link = "Number" },

        Function = { link = "Normal" },

        Operator = { fg = colors.flamingo },
        Delimiter = { link = "Operator" },

        -- Keyword
        Keyword = { fg = colors.yellow },
        Include = { link = "Keyword" },
        Repeat = { link = "Keyword" },
        Conditional = { link = "Keyword" },
        Exception = { link = "Keyword" },

        Type = { fg = colors.blue },

        -- Strings
        String = { fg = colors.lavender },
        Label = { link = "String" },
        Character = { link = "String" },

        --
        -- Syntax - Treesitter
        --
        ["@text"] = { link = "Normal" },
        ["@type"] = { link = "Type" },
        ["@type.definition"] = { link = "Normal" },
        ["@module"] = { link = "Normal" },
        ["@namespace.name"] = { link = "Normal" },

        ["@function"] = { link = "Function" },
        ["@function.builtin"] = { link = "Function" },
        ["@method"] = { link = "Function" },
        ["@constructor"] = { link = "Function" },

        ["@constant"] = { link = "Identifier" },
        ["@constant.builtin"] = { link = "@constant" },
        ["@constant.macro"] = { link = "Macro" },
        ["@variable"] = { link = "Variable" },
        ["@variable.builtin"] = { link = "@variable" },
        ["@variable.parameter"] = { link = "@variable" },
        ["@variable.member"] = { link = "@variable" },
        ["@parameter"] = { link = "@variable" },
        ["@field"] = { link = "@variable" },
        ["@keyword"] = { link = "Keyword" },
        ["@keyword.function"] = { link = "Keyword" },
        ["@keyword.return"] = { link = "Keyword" },
        ["@keyword.operator"] = { link = "Keyword" },
        ["@property"] = { link = "@variable" },

        ["@string"] = { link = "String" },
        ["@character"] = { link = "String" },
        ["@number"] = { link = "Number" },
        ["@float"] = { link = "Number" },
        ["@boolean"] = { link = "Number" },

        ["@operator"] = { link = "Operator" },
        ["@punctuation"] = { link = "Operator" },
        ["@punctuation.delimiter"] = { link = "Operator" },
        ["@punctuation.special"] = { link = "Operator" },

        ["@type.builtin"] = { link = "Keyword" },
        ["@tag"] = { link = "Keyword" },
        ["@tag.delimiter"] = { link = "Operator" },
        ["@namespace"] = { link = "Keyword" },
        ["@punctuation.bracket"] = { link = "Operator" },
        ["@function.macro"] = { link = "Macro" },

        -- Comments
        ["@punctuation.delimiter.comment"] = { link = "@Comment" },
        ["@comment.error"] = { link = "@Comment" },
        ["@comment.warning"] = { link = "@Comment" },
        ["@comment.todo"] = { link = "@Comment" },
        ["@comment.note.comment"] = { link = "@Comment" },
        ["@number.comment"] = { link = "Number" },

        -- LSP Semantic tokens
        ["@lsp.type.property"] = { link = "@property" },
        ["@lsp.type.enumMember"] = { link = "@member" },
        ["@lsp.type.namespace"] = { link = "Normal" },

        -- Bash
        ["@variable.parameter.bash"] = { link = "@variable" },

        -- Makefile
        ["@function.make"] = { link = "Keyword" },
        ["@string.special.symbol.make"] = { link = "@variable" },

        -- Markup
        ["@markup.raw"] = { link = "Normal" },
        ["@markup.strong"] = { link = "Normal" },
        ["@markup.italic"] = { link = "Normal" },

        -- PHP
        ["@keyword.import.php"] = { link = "Keyword" },
        ["@function.builtin.php"] = { link = "Function" },
        ["@class.declaration.name.php"] = { link = "Normal" },
        ["@class.declaration.inherit.name.php"] = { link = "Normal" },
        ["@class.declaration.implement.name.php"] = { link = "Normal" },
        ["@interface.name.php"] = { link = "Normal" },
        ["@namespace.name.php"] = { link = "Normal" },
        ["@namespace.alias.name.php"] = { link = "@namespace.name.php" },
        ["@use.trait.name.php"] = { link = "Keyword" },
        ["@class.use.base.php"] = { link = "Keyword" },

        -- Blade
        ["@directive.blade"] = { link = "PreProc" },
    }
end

return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
        flavour = "mocha",
        transparent_background = not vim.g.neovide,
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
        custom_highlights = custom_highlights,
        integrations = {
            cmp = true,
            treesitter = true,
            neotree = true,
            telescope = {
                enabled = true,
            },
        }
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
