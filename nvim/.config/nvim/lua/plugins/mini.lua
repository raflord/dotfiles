return {
	"nvim-mini/mini.nvim",
	version = false,
	lazy = true,
	event = "VeryLazy",
	config = function()
		-- Comment toggling (gc, gb, etc.)
		require("mini.comment").setup()
		-- Surround (add/delete/change surrounding characters)
		require("mini.surround").setup()
	end,
}
