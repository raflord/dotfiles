return {
	"HiPhish/rainbow-delimiters.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("rainbow-delimiters.setup").setup({
			strategy = {},
			query = {
				tsx = "rainbow-parens",
				typescript = "rainbow-parens",
				html = "rainbow-parens",
			},
			highlight = {
				"RainbowDelimiterYellow",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
				"RainbowDelimiterBlue",
			},
		})
	end,
}
