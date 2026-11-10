--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/ and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

suppressMaximizeRule:set_enabled(true)

-- Target standalone mpv media windows (placed at top for high priority)
hl.window_rule({
    name = "mpv_stuff",
    match = { class = "mpv" },
    float = true,
    center = true,
    focus_on_activate = true,
    size = { "monitor_w*0.7", "monitor_h*0.7" },
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

-- Scratchpad Rules
hl.window_rule({
    name = "kitty_dropterm_scratchpad",
    match = { class = "^kitty-dropterm$" },
    float = true,
    size = { "monitor_w*0.7", "monitor_h*0.7" },
    center = true,
    stay_focused = true,
    workspace = "special:term silent",
})

hl.window_rule({
    name = "kitty_dropneomutt_scratchpad",
    match = { class = "kitty-dropneomutt" },
    float = true,
    size = { "monitor_w*0.7", "monitor_h*0.7" },
    center = true,
    stay_focused = true,
    workspace = "special:neomutt silent",
})

hl.window_rule({
    name = "kitty_dropcmus_scratchpad",
    match = { class = "kitty-dropcmus" },
    float = true,
    size = { "monitor_w*0.7", "monitor_h*0.7" },
    center = true,
    stay_focused = true,
    workspace = "special:cmus silent",
})

-- Waybar & Utility Rules
hl.window_rule({
    name = "alacritty_floating",
    match = { class = "Alacritty" },
    float = true,
    no_follow_mouse = true,
    stay_focused = true,
})

hl.window_rule({
    name = "pavucontor_floating",
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
    pin = true,
    size = { 2000, 1000 },
    no_follow_mouse = true,
    stay_focused = true,
})

-- Workspace Mapping Rules
hl.window_rule({
    name = "kitty",
    match = { class = "^(kitty)$" },
    workspace = "2",
})

hl.window_rule({
    name = "browsers",
    match = { class = "^(firefox|brave-browser)$" },
    workspace = "1",
})

hl.window_rule({
    name = "kitty-tasks",
    match = { class = "^(kitty-tasks)$" },
    workspace = "3",
    group = "deny",
})

hl.window_rule({
    name = "kitty-nvim",
    match = { class = "kitty-nvim" },
    workspace = "4",
})

hl.window_rule({
    name = "kitty-weechat",
    match = { class = "kitty-weechat" },
    workspace = "5",
})

hl.window_rule({
    name = "kitty-yazi",
    match = { class = "kitty-yazi" },
    workspace = "7",
})


hl.window_rule({
    name = "kitty-weechat2",
    match = {
        class = "kitty",
        title = "weechat",
    },
    workspace = "6",
})

hl.window_rule({
    name = "browser transparency",
    match = {
        class = "^(brave-browser|firefox)$",
    },
    opacity = "0.85 0.85",
})

hl.window_rule({
    name = "mpv_file_picker",
    match = {
        class = "xdg-desktop-portal-gtk",
        title = "Open File with mpv",
    },
    float = true,
    center = true,
    pin = true,
    size = { 900, 650 },
    stay_focused = true,
})

hl.window_rule({
    name = "khal_calendar_popup",
    match = {
        class = "khal_calendar",
    },
    float = true,
    move = "cursor 0% 100%",
    size = { 1800, 800 },
})

hl.on("window.open", function(win)
    local class = type(win) == "table" and (win.class or win.initialClass) or ""
    if class:lower():match("mpv") then
        -- Pull mpv to the current workspace and focus it immediately
        hl.dispatch("movetoworkspace", "active")
        hl.dispatch("focuswindow", "class:mpv")
    end
end)
