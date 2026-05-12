vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
	bigfile = { enabled = true },
	indent = { enabled = true },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	image = { enabled = false },
})
