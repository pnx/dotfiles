local wezterm = require 'wezterm'

return {
    default_prog = { 'pwsh' },

    -- Fonts
    --
    font_size = 16,
    line_height = 1.3,
    font = wezterm.font {
        family = 'IosevkaCustom',
        harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
    },

    -- Window
    --
    window_background_opacity = 0.98,
    window_padding = {
        top = 0,
    },

    -- Tabs
    --
    enable_tab_bar = true,
    use_fancy_tab_bar = false,

    -- Colors
    --
    colors = {
        -- The default text color
        foreground = '#eceef4',
        -- The default background color
        background = '#0E1019',

        -- Overrides the cell background color when the current cell is occupied by the
        -- cursor and the cursor style is set to Block
        cursor_bg = '#767BA0',
        -- Overrides the text color when the current cell is occupied by the cursor
        cursor_fg = '#eceef4',
        -- Specifies the border color of the cursor when the cursor style is set to Block,
        -- or the color of the vertical or horizontal bar when the cursor style is set to
        -- Bar or Underline.
        cursor_border = '#767BA0',

        -- the foreground color of selected text
        -- selection_fg = 'black',
        -- the background color of selected text
        selection_bg = '#fffacd',

        -- The color of the scrollbar "thumb"; the portion that represents the current viewport
        scrollbar_thumb = '#222222',

        -- The color of the split lines between panes
        split = '#444444',

        ansi = {
            '#45475A',
            '#F38BA8',
            '#A6E3A1',
            '#F9E2AF',
            '#89B4FA',
            '#F5C2E7',
            '#94E2D5',
            '#BAC2DE',
        },
        brights = {
            '#585B70',
            '#F38BA8',
            '#A6E3A1',
            '#F9E2AF',
            '#89B4FA',
            '#F5C2E7',
            '#94E2D5',
            '#A6ADC8',
        },

        -- Arbitrary colors of the palette in the range from 16 to 255
        -- indexed = { [136] = '#af8700' },

        -- Since: 20220319-142410-0fcdea07
        -- When the IME, a dead key or a leader key are being processed and are effectively
        -- holding input pending the result of input composition, change the cursor
        -- to this color to give a visual cue about the compose state.
        compose_cursor = 'red',

        tab_bar = {
            -- The color of the strip that goes along the top of the window
            -- (does not apply when fancy tab bar is in use)
            background = '#0D0F17',

            -- The active tab is the one that has focus in the window
            active_tab = {
                bg_color = '#1a1c2d',
                fg_color = '#eceef4',
            },

            -- Inactive tabs are the tabs that do not have focus
            inactive_tab = {
                bg_color = '#0D0F17',
                fg_color = '#eceef4',
            },

            -- You can re some alternate styling when the mouse pointer
            -- moves over inactive tabs
            inactive_tab_hover = {
                bg_color = '#1a1c2d',
                fg_color = '#eceef4',
            },

            -- The new tab button that let you create new tabs
            new_tab = {
                bg_color = '#0D0F17',
                fg_color = '#eceef4',
            },

            -- You can re some alternate styling when the mouse pointer
            -- moves over the new tab button
            new_tab_hover = {
                bg_color = '#1a1c2d',
                fg_color = '#eceef4',
            },
        },
    },
}
