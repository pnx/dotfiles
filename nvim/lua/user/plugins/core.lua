local icons = require('user.icons')

local backdrop = user.backdrop or 80

local border = {" "}

local toggle_preview = function(picker)
    local layout = vim.deepcopy(picker.resolved_layout)

    -- helper: find the "preview" node in the layout tree
    local function find_preview(root)
        if root.win == "preview" then
            return root
        end
        if #root > 0 then
            for _, child in ipairs(root) do
                local found = find_preview(child)
                if found then
                    return found
                end
            end
        end
    end

    local preview = find_preview(layout.layout)
    if not preview then
        return
    end

    layout.hidden = layout.hidden or {}

    local hidden = false
    for i, name in ipairs(layout.hidden) do
        if name == "preview" then
            hidden = true
            table.remove(layout.hidden, i)
            break
        end
    end

    if hidden then
        -- preview was hidden -> show it again
        -- restore your preferred normal width/height
        if layout.layout.width then
            layout.layout.width = 0.8
        end
        if layout.layout.height then
            layout.layout.height = 0.8
        end
    else
        -- preview was visible -> hide it and compact the picker
        table.insert(layout.hidden, "preview")

        -- make the main picker smaller when preview is hidden
        -- tweak this depending on your preset
        if layout.layout.width then
            layout.layout.width = 0.4
        end
        if layout.layout.height then
            layout.layout.height = 0.4
        end
    end

    picker:set_layout(layout)
end

local finder = {
    prompt = " ",
    layouts = {
        default = {
            hidden = { "preview" },
            layout = {
                box = "horizontal",
                width = 0.4,
                height = 0.4,
                border = false,
                {
                    box = "vertical",
                    { win = "list", border = border,  title = "Results" },
                    { win = "input", border = border, height = 1, title = "{title} {live} {flags}" },
                },
                { win = "preview", border = border, title = "{preview}", width = 0.5 },
            },
        },
    },
    actions = {
        toggle_preview_compact = toggle_preview
    },
    win = {
        input = {
            keys = {
                ["<Esc>"] = { "close", mode = { "n", "i" } },
                ["<c-p>"] = { "toggle_preview_compact", mode = { "i", "n" } },
            }
        }
    }
}

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        picker = finder,
        dashboard = {
            preset = {
                header = [[
 ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
 ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██
▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░
         ░    ░  ░    ░ ░        ░   ░         ░
                                ░                  ]],
                keys = {
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            }
        },
        notifier = {
            style = 'minimal',
            margin = { top = 0, right = 2, bottom = 2 },
            gap = 1,
            level = vim.log.levels.INFO,
            icons = {
                info = icons.diagnostics.info .. " ",
                warn = icons.diagnostics.warn .. " ",
                error = icons.diagnostics.error .. " ",
                debug = icons.diagnostics.debug .. " ",
                trace = icons.diagnostics.trace .. " "
            },
            top_down = false,
        },
        styles = {
            float = {
                backdrop = {
                    blend = backdrop,
                },
            },
            input = {
                backdrop = {
                    blend = backdrop,
                },
            },
        },
    }
}
