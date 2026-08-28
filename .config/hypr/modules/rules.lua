---@module 'hl'

hl.window_rule({
    name  = "suppress-maximize-events",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- Move Spotify to its own workspace
hl.window_rule({
    name  = "spotify-workspace",
    match = {
        class = "Spotify",
    },
    workspace = "name:",
})

-- Move Plexamp to its own workspace
hl.window_rule({
    name  = "plexamp-workspace",
    match = {
        class = "plexamp",
    },
    workspace = "name:󰚺",
})

-- Move TeamSpeak to its own workspace
hl.window_rule({
    name  = "teamspeak-workspace",
    match = {
        class = "TeamSpeak 3",
    },
    workspace = "name:",
})

-- Move Steam to its own workspace
hl.window_rule({
    name  = "steam-workspace",
    match = {
        class = "steam",
    },
    workspace = "name:",
})

hl.window_rule({
    name  = "iw3mp-nofloat",
    match = {
        class  = "iw3mp.exe",
    },
    float = false,
})

hl.window_rule({
    name  = "iw3mp-fullscreen",
    match = {
        class  = "iw3mp.exe",
    },
    fullscreen = true,
})

-- Make brave file select window float
hl.window_rule({
    name  = "brave-file-select-float",
    match = {
        class  = "brave",
    },
    float = true,
})

-- No gaps and borders on workspace 1
hl.workspace_rule({
    workspace = 1,
    gaps_out = 0,
    gaps_in = 0,
    border_size = 0,
    no_shadow = true,
    --rounding = 10, TODO: what's the current name?
})
