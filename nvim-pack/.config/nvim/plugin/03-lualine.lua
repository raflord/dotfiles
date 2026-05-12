vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
})
local lualine = require("lualine")

local mode = {
	"mode",
	fmt = function(str)
		return " " .. str
	end,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
}

local filename = {
	"filename",
	file_status = true,
	path = 0,
}

local branch = { "branch", icon = { "", color = { fg = "#A6D4DE" } }, "|" }

lualine.setup({
	icons_enabled = true,
	options = {
		theme = "auto",
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { diff, filename },
		lualine_x = {
			{ "filetype" },
		},
	},
})
