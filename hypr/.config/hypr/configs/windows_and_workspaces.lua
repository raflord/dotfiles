hl.workspace_rule({ workspace = "01", monitor = "DP-1" })
hl.workspace_rule({ workspace = "02", monitor = "DP-1" })
hl.workspace_rule({ workspace = "03", monitor = "DP-1" })
hl.workspace_rule({ workspace = "04", monitor = "DP-1" })
hl.workspace_rule({ workspace = "05", monitor = "DP-1" })
hl.workspace_rule({ workspace = "06", monitor = "DP-1" })
hl.workspace_rule({ workspace = "07", monitor = "DP-1" })
hl.workspace_rule({ workspace = "08", monitor = "DP-1" })
hl.workspace_rule({ workspace = "09", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1" })

hl.window_rule({
	name = "calculator",
	match = { class = "org.gnome.Calculator", title = "Calculator", float = true },
})

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
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

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
