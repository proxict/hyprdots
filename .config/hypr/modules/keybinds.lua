---@module 'hl'

function mod(...)
    local args = { "SUPER + ", ... }
    return table.concat(args, " ")
end

----------------
--- TERMINAL ---
----------------
hl.bind(mod("Return"), hl.dsp.exec_cmd("kitty"))

--------------
--- LAYOUT ---
--------------
hl.bind(mod("SHIFT + Q"), hl.dsp.window.close())
hl.bind(mod("SHIFT + e"), hl.dsp.exec_cmd("zenity --question --text \"Do you really want to quit Hyprland?\" && hyprctl dispatch exit"))
hl.bind(mod("SHIFT + period"), hl.dsp.exec_cmd("hyprlock"))
hl.bind(mod("Space"), hl.dsp.exec_cmd("for device in $(hyprctl devices -j | jq -r '.keyboards[] | .name'); do hyprctl switchxkblayout $device next; done"))
hl.bind(mod("SHIFT + Space"), hl.dsp.window.float())
hl.bind(mod("D"), hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mod("P"), hl.dsp.window.pseudo()) -- dwindle (maintain window size when tiled)
hl.bind(mod("G"), hl.dsp.layout("togglesplit"))
hl.bind(mod("M"), hl.dsp.layout("movetoroot active unstable"))
hl.bind(mod("SHIFT + J"), hl.dsp.layout("swapsplit"))
hl.bind(mod("SHIFT + K"), hl.dsp.layout("swapsplit"))
hl.bind(mod("SHIFT + H"), hl.dsp.layout("swapsplit"))
hl.bind(mod("SHIFT + L"), hl.dsp.layout("swapsplit"))
hl.bind(mod("S"), hl.dsp.layout("preselect d"))
hl.bind(mod("F"), hl.dsp.window.fullscreen())
hl.bind(mod("SHIFT + F"), hl.dsp.window.fullscreen({mode = "maximized"}))

-----------------------
--- WINDOW FOCUSING ---
-----------------------
hl.bind(mod("h"), hl.dsp.focus({ direction = "left" }))
hl.bind(mod("l"), hl.dsp.focus({ direction = "right" }))
hl.bind(mod("k"), hl.dsp.focus({ direction = "up" }))
hl.bind(mod("j"), hl.dsp.focus({ direction = "down" }))
hl.bind(mod("left"), hl.dsp.focus({ direction = "left" }))
hl.bind(mod("right"), hl.dsp.focus({ direction = "right" }))
hl.bind(mod("up"), hl.dsp.focus({ direction = "up" }))
hl.bind(mod("down"), hl.dsp.focus({ direction = "down" }))

---------------------------
--- WORKSPACE SWITCHING ---
---------------------------
hl.bind(mod("1"), hl.dsp.focus({ workspace = 1 }))
hl.bind(mod("2"), hl.dsp.focus({ workspace = 2 }))
hl.bind(mod("3"), hl.dsp.focus({ workspace = 3 }))
hl.bind(mod("4"), hl.dsp.focus({ workspace = 4 }))
hl.bind(mod("5"), hl.dsp.focus({ workspace = 5 }))
hl.bind(mod("6"), hl.dsp.focus({ workspace = 6 }))
hl.bind(mod("7"), hl.dsp.focus({ workspace = 7 }))
hl.bind(mod("8"), hl.dsp.focus({ workspace = 8 }))
hl.bind(mod("9"), hl.dsp.focus({ workspace = 9 }))
hl.bind(mod("0"), hl.dsp.focus({ workspace = 10 }))
hl.bind(mod("T"), hl.dsp.focus({ workspace = "name:" }))
hl.bind(mod("U"), hl.dsp.focus({ workspace = "name:󱞼" }))

---------------------
--- WINDOW MOVING ---
---------------------
hl.bind(mod("SHIFT + 1"), hl.dsp.window.move({ workspace = 1 }, { follow = false }))
hl.bind(mod("SHIFT + 2"), hl.dsp.window.move({ workspace = 2 }, { follow = false }))
hl.bind(mod("SHIFT + 3"), hl.dsp.window.move({ workspace = 3 }, { follow = false }))
hl.bind(mod("SHIFT + 4"), hl.dsp.window.move({ workspace = 4 }, { follow = false }))
hl.bind(mod("SHIFT + 5"), hl.dsp.window.move({ workspace = 5 }, { follow = false }))
hl.bind(mod("SHIFT + 6"), hl.dsp.window.move({ workspace = 6 }, { follow = false }))
hl.bind(mod("SHIFT + 7"), hl.dsp.window.move({ workspace = 7 }, { follow = false }))
hl.bind(mod("SHIFT + 8"), hl.dsp.window.move({ workspace = 8 }, { follow = false }))
hl.bind(mod("SHIFT + 9"), hl.dsp.window.move({ workspace = 9 }, { follow = false }))
hl.bind(mod("SHIFT + 0"), hl.dsp.window.move({ workspace = 10 }, { follow = false }))
hl.bind(mod("SHIFT + T"), hl.dsp.window.move({ workspace = "name:" }, { follow = false }))
hl.bind(mod("SHIFT + U"), hl.dsp.window.move({ workspace = "name:󱞼" }, { follow = false }))

-----------------------
--- WINDOW RESIZING ---
-----------------------
hl.bind(mod("R"), hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })

    hl.bind("l", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
    hl.bind("h", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })
    hl.bind("j", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })

    hl.bind("Escape", hl.dsp.submap("reset"))
    hl.bind("Return", hl.dsp.submap("reset"))
end)

-- Move/resize windows with mod + LMB/RMB and dragging
hl.bind(mod("mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(mod("mouse:273"), hl.dsp.window.resize(), { mouse = true })

-------------------------
--- CLIPBOARD HISTORY ---
-------------------------
hl.bind(mod("V"), hl.dsp.exec_cmd("cliphist list| rofi -dmenu| cliphist decode| wl-copy"))

------------------------------------------------------------
--- LAPTOP MULTIMEDIA KEYS FOR VOLUME AND LCD BRIGHTNESS ---
------------------------------------------------------------
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n236 set 5%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n236 set 5%-"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl -p spotify,Plexamp,%any next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl -p spotify,Plexamp,%any play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl -p spotify,Plexamp,%any play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl -p spotify,Plexamp,%any previous"), { locked = true })

---------------------
--- NOTIFICATIONS ---
---------------------
hl.bind("CONTROL + Space", hl.dsp.exec_cmd("dunstctl close"), { locked = true })
hl.bind("CONTROL + SHIFT + Space", hl.dsp.exec_cmd("dunstctl close-all"), { locked = true })
hl.bind("CONTROL + grave", hl.dsp.exec_cmd("dunstctl history-pop"))
hl.bind("CONTROL + SHIFT + period", hl.dsp.exec_cmd("dunstctl context"))

-------------------
--- SCREENSHOTS ---
-------------------
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m active -m output -o ~/screenshots/"))
hl.bind(mod("Print"), hl.dsp.exec_cmd("hyprshot -z -m region -o ~/screenshots/"))
hl.bind(mod("SHIFT + Print"), hl.dsp.exec_cmd("hyprshot -m active -m window -o ~/screenshots/"))

---------------------------------------
--- PYTHON INTERPRETER (CALCULATOR) ---
---------------------------------------
hl.bind(mod("C"), hl.dsp.exec_cmd("[float on; size 800 600; center] kitty -e python -i -c 'import math' -q 2>/dev/null"))

---------------------
--- RELOAD WAYBAR ---
---------------------
hl.bind(mod("SHIFT + R"), hl.dsp.exec_cmd("systemctl --user reload waybar.service || systemctl --user restart waybar.service"))

----------------------
--- EMOJI SELECTOR ---
----------------------
hl.bind(mod("e"), hl.dsp.exec_cmd("~/.config/emoji/emoji-selector.sh"))
