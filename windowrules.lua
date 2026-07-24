--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)


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

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

--floating rule 

--pypr stuff
hl.window_rule({
		name = "kitty_floating",
		match = { class = "kitty-dropterm" },
		float = true,
		no_follow_mouse = true,
		stay_focused = true,
	})
hl.window_rule ({
		name = "kitty-cmus_floating",
		match = { class = "kitty-cmus"},
		float = true,
		pin = false,
		no_follow_mouse = true,
		stay_focused = true,
	})
hl.window_rule ({
		name = "neomutt_flaotinging",
		match = { class = "neomutt1"},
		float = true,
		pin = true,
		no_follow_mouse = true,
		stay_focused = true,
	})



-- waybar rules --kind of 
hl.window_rule({
		name = "alacritty_floating",
		match = { class = "Alacritty"},
		float = true,
		no_follow_mouse = true,
		stay_focused = true,
	})
hl.window_rule ({
		name = "pavucontor_floating",
		match = { class = "org.pulseaudio.pavucontrol"},
		float = true,
		pin = true,
		size = {2000, 1000},
		no_follow_mouse = true,
		stay_focused = true,
	})


-- workspace rules
hl.window_rule ({
		name = "kitty",
		match = {class = "kitty"},
		workspace = "3",
	})
hl.window_rule ({
		name = "browsers",
		match = {class = "^(firefox|brave-browser)$"},
		workspace = "2",
	})
hl.window_rule ({
		name = "kitty-tasks",
		match = {class = "kitty-tasks"},
		workspace = "4",
	})
hl.window_rule ({
		name = "kitty-nvim",
		match = {class = "kitty-nvim"},
		workspace = "5",
	})
hl.window_rule ({
		name = "kitty-weechat",
		match = {class = "kitty-weechat"},
		workspace = "6",
	})
hl.window_rule ({
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
