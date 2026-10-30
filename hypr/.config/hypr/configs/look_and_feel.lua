hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 1,
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},

	dwindle = {
		preserve_split = true,
		force_split = 2,
	},

	decoration = {
		rounding = 0,
		shadow = { enabled = false },
		blur = { enabled = false },
	},

	animations = { enabled = false },
})

hl.window_rule({
	name = "smart-borders-wtv1",
	match = {
		float = false,
		workspace = "w[tv1]",
	},
	border_size = 0,
})
