local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Clear last highlighted word
vim.keymap.set("n", "<leader>h", function()
	vim.cmd("noh")
end, { desc = "clear last highlighted word" })

-- Paste without replacing clipboard content
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copies or Yank to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)

-- Leader d delete wont remember as yanked/clipboard when delete pasting
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Format without prettier using the built in
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format file" })

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
