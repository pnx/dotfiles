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
                Visual = { bg = colors.overlay1 },
                FoldColumn = { fg = colors.surface2 },

                -- Floating windows
                NormalFloat = { fg = colors.text, bg = colors.crust },
                FloatTitle = { fg = colors.base, bg = colors.blue },
                FloatBorder = { fg = colors.surface1, bg = colors.crust },

                -- Window separator
                WinSeparator = { fg = colors.surface0 },

                -- Menus
                Pmenu = { link = "NormalFloat" },
                PmenuSel = { bg = colors.surface1 },
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
                TelescopeSelection = { link = "PmenuSel" },
                TelescopeIndicatorModified = { fg = colors.yellow },
                TelescopeIndicatorReadonly = { fg = colors.red },
                TelescopeIndicatorHidden = { link = "TelescopeResultsComment" },

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

                -- Bash
                ["@variable.parameter.bash"] = { fg=colors.rosewater },

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
