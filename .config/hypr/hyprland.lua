---@module 'hl'

---------------
--- SYSTEMD ---
---------------
-- Let systemd know that hyprland is up and running (a prerequisite for waybar, hyprsunset, etc)
hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprland.target")
end)

-----------------
--- MONITORS ---
-----------------
require("modules/monitors")

-----------------
--- AUTOSTART ---
-----------------
 require("modules/autostart")

-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------
hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)
require("modules/env")

----------------
--- XWAYLAND ---
----------------
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

---------------------
--- LOOK AND FEEL ---
---------------------
-- Enable dark mode
hl.on("config.reloaded", function()
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme Orchis-Dark")
end)
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 1,
        -- https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,
        -- Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle",
        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
    },

    dwindle = {
        preserve_split = true,
        -- You probably want this
        force_split = 2,
        -- 0 -> split follows mouse, 1 -> always split to the left, 2 -> always split to the right
    },

    cursor = {
        inactive_timeout = 5,
        no_warps = true,
    },

    decoration = {
        rounding = 5,
        rounding_power = 2,
        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        -- https://wiki.hypr.land/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = 5,
            passes = 2,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    misc = {
        force_default_wallpaper = -1,
        -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true,
        -- If true disables the random hyprland logo / anime girl background. :(
    },
})

hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default", style = "fade" })
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "default", style = "popin" })

hl.layer_rule({
    match = {
        namespace = "match:namespace wofi",
    },
    blur = true,
})

-------------
--- INPUT ---
-------------
require("modules/input")

-------------------
--- KEYBINDINGS ---
-------------------
require("modules/keybinds")

------------------------------
--- WINDOWS AND WORKSPACES ---
------------------------------
require("modules/rules")
