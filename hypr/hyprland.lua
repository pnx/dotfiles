-- Hyprland 0.56.2 Lua configuration, migrated from hyprland.conf.

-- Variables
-- -----------------------------------------

-- Monitors
local mainMonitor = "DP-2"
local secondMonitor = "HDMI-A-1"

-- Programs
local terminal = "ghostty"
local menu = "rofi -show drun"
local runProgram = "rofi -show run"
local screenshot = 'grim -g "$(slurp)" - | wl-copy'

-- Theme
local borderColor = "rgb(1a1c2d)"

local kb_super = "SUPER"

-- Autostart programs
local autostart = {
    "hypridle",
    "hyprpaper",
    "waybar",
    "dunst",
    "nm-applet",
    "nextcloud",
    "telegram",
}

-- Scripts
local focusOrStart = ".config/hypr/scripts/focus-or-start.sh"

-- Environment
-- -----------------------------------------

hl.env("XCURSOR_THEME", "Qogir")
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- Settings
-- -----------------------------------------

hl.config({
    general = {
        gaps_in = { top = 0, right = 0, bottom = -1, left = -1 },
        gaps_out = -1,
        border_size = 1,
        col = {
            active_border = borderColor,
            inactive_border = borderColor,
        },
        layout = "dwindle",
        allow_tearing = false,
        resize_on_border = false,
    },
    input = {
        kb_layout = "pnx-us-se",
        follow_mouse = 1,
        accel_profile = "flat",
        force_no_accel = true,
    },
    cursor = {
        no_hardware_cursors = true,
        enable_hyprcursor = true,
        hide_on_key_press = false,
    },
    decoration = {
        rounding = 0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        dim_inactive = false,
        dim_strength = 0.1,
        blur = {
            enabled = true,
            size = 4,
            passes = 2,
            popups = true,
            ignore_opacity = false,
        },
        shadow = {
            enabled = false,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
        precise_mouse_move = true,
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        background_color = 0x000000,
        disable_autoreload = true,
    },
    debug = {
        overlay = false,
        disable_logs = false,
    },
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
})

hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "border", enabled = false })
hl.animation({ leaf = "borderangle", enabled = false })
hl.animation({ leaf = "fade", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "default" })

-- Monitors
-- -----------------------------------------

hl.monitor({
    output = mainMonitor,
    mode = "preferred",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = secondMonitor,
    mode = "1920x1080@60",
    position = "760x-1080",
    scale = 1,
    reserved_area = 25,
})

-- Workspaces and windows
-- -----------------------------------------

for workspace = 1, 4 do
    hl.workspace_rule({
        workspace = tostring(workspace),
        monitor = mainMonitor,
        default = true,
    })
end

hl.workspace_rule({
    workspace = "5",
    monitor = secondMonitor,
    persistent = true,
    default = true,
})

hl.window_rule({
    match = { float = true },
    opacity = 0.9,
})

hl.window_rule({
    match = { class = "firefox" },
    workspace = "2",
})

hl.window_rule({
    match = { class = "org.telegram.desktop.*" },
    workspace = "5",
})

hl.layer_rule({
    name = "dim",
    match = { namespace = "^rofi$" },
    dim_around = true,
})

-- Keybindings
-- -----------------------------------------

hl.bind(kb_super .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(kb_super .. " + P", hl.dsp.exec_cmd(runProgram))
hl.bind(kb_super .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(kb_super .. " + T", hl.dsp.exec_cmd(focusOrStart .. ' "telegram" "org.telegram"'))
hl.bind(kb_super .. " + G", hl.dsp.exec_cmd(focusOrStart .. ' "vivaldi-stable" "vivaldi-stable"'))
hl.bind(kb_super .. " + S", hl.dsp.exec_cmd(screenshot))

hl.bind(kb_super .. " + X", hl.dsp.window.close())
hl.bind(kb_super .. " + F", hl.dsp.window.float({ action = "toggle" }))

local focusBindings = {
    { "left", "left" },
    { "H", "left" },
    { "right", "right" },
    { "L", "right" },
    { "up", "up" },
    { "K", "up" },
    { "down", "down" },
    { "J", "down" },
}

for _, binding in ipairs(focusBindings) do
    hl.bind(kb_super .. " + " .. binding[1], hl.dsp.focus({ direction = binding[2] }))
end

for workspace = 1, 5 do
    hl.bind(kb_super .. " + " .. workspace, hl.dsp.focus({ workspace = workspace }))
    hl.bind(kb_super .. " + SHIFT + " .. workspace,
        hl.dsp.window.move({ workspace = workspace, follow = true }))
end

hl.bind(kb_super .. " + mouse:272", hl.dsp.window.drag())
hl.bind(kb_super .. " + mouse:273", hl.dsp.window.resize())

-- Autostart (once per Hyprland session, not on config reload)
-- -----------------------------------------

hl.on("hyprland.start", function()
    for _, command in ipairs(autostart) do
        hl.exec_cmd(command)
    end
end)
