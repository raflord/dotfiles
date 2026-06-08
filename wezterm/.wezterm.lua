local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action

-- Font Config
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 17

-- Colorscheme https://github.com/scottmckendry/cyberdream.nvim
config.colors = {
	foreground = "#ffffff",
	background = "#16181a",

	cursor_bg = "#ffffff",
	cursor_fg = "#16181a",
	cursor_border = "#ffffff",

	selection_fg = "#ffffff",
	selection_bg = "#3c4048",

	scrollbar_thumb = "#16181a",
	split = "#16181a",

	ansi = { "#16181a", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
	brights = { "#3c4048", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
	indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
}

-- Window configurations
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_background_opacity = 0.5
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Keybind config
config.keys = {}
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
table.insert(config.keys, { key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") })
table.insert(config.keys, { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) })
table.insert(config.keys, { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) })
table.insert(config.keys, { key = "l", mods = "LEADER", action = act.ActivateLastTab })
table.insert(config.keys, { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) })
table.insert(config.keys, { key = "/", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) })
table.insert(
	config.keys,
	{ key = "'", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) }
)
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

return config
