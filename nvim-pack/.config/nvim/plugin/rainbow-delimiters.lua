vim.pack.add({ "https://github.com/HiPhish/rainbow-delimiters.nvim" })

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
