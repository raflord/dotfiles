local terminal = "ghostty"
local fileManager = "thunar"
local menu = "wofi --show drun"

local mainMod = "ALT" -- Sets "Alt" key as main modifier

local bind = hl.bind
-- Custom binds
bind("PRINT", hl.dsp.exec_cmd("hyprshot -m window -o ~/Screenshots"))
bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -o ~/Screenshots"))
bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
bind(mainMod .. " + Q", hl.dsp.window.close())
bind(
	mainMod .. " + SHIFT + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Move focus with mainMod + hjkl
bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

-- Move window with mainMod + arrow keys
bind(mainMod .. " + left", hl.dsp.window.move({ direction = "left" }))
bind(mainMod .. " + down", hl.dsp.window.move({ direction = "down" }))
bind(mainMod .. " + up", hl.dsp.window.move({ direction = "up" }))
bind(mainMod .. " + right", hl.dsp.window.move({ direction = "right" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys for volume
bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"),
	{ locked = true, repeating = true }
)
bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),
	{ locked = true, repeating = true }
)
bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

-- Requires playerctl
bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
