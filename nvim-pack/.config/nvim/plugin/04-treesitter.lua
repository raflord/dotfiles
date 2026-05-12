vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/windwp/nvim-ts-autotag",
})

local ensureInstalled = {
	"c",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"markdown",
	"markdown_inline",
	"tsx",
	"html",
	"xml",
	"css",
	"go",
	"yaml",
	"dockerfile",
	"markdown",
	"bash",
	"javascript",
	"typescript",
	"python",
	"json",
	"prisma",
}
local alreadyInstalled = require("nvim-treesitter.config").get_installed()
local parsersToInstall = vim.iter(ensureInstalled)
	:filter(function(parser)
		return not vim.tbl_contains(alreadyInstalled, parser)
	end)
	:totable()
require("nvim-treesitter").install(parsersToInstall)

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- NOTE: js,ts,jsx,tsx Auto Close Tags
require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true, -- Auto-close tags
		enable_rename = true, -- Auto-rename pairs
		enable_close_on_slash = false, -- Disable auto-close on trailing `</`
		ft = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact" },
	},
	per_filetype = {
		["html"] = {
			enable_close = true, -- Disable auto-closing for HTML
		},
		["typescriptreact"] = {
			enable_close = true, -- Explicitly enable auto-closing (optional, defaults to `true`)
		},
	},
})
