return {
	{
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanso").setup({
				compile = true,
				background = { dark = "zen", light = "pearl" },
				foreground = "saturated",
				transparent = true,
			})
			vim.cmd.colorscheme("kanso")
		end,
	},
}
