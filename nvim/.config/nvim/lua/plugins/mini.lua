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
		-- Show notifications
		require("mini.notify").setup({
			content = {
				format = function(notif)
					return notif.msg
				end,
			},
			window = {
				config = function()
					return {
						title = "",
						anchor = "SE",
						row = vim.o.lines - 2,
						col = vim.o.columns,
						border = "none",
					}
				end,
			},
		})
	end,
}
