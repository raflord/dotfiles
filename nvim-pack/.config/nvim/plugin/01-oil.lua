vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
	columns = { "icon" },
	keymaps = { ["<C-h>"] = false },

	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in oil" }),
})
