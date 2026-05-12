vim.pack.add({ "https://github.com/Davidyz/inlayhint-filler.nvim" })

require("inlayhint-filler").setup({
	vim.keymap.set("n", "<leader>I", function()
		require("inlayhint-filler").fill()
	end, { desc = "Insert the inlay-hint under cursor into the buffer." }),
})
