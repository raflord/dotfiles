return {
	"sphamba/smear-cursor.nvim",
	config = function()
		require("smear_cursor").setup({
			cursor_color = "#FFFFFF",
			stiffness = 0.5,
			trailing_stiffness = 0.49,
			never_draw_over_target = false,
		})
	end,
}
