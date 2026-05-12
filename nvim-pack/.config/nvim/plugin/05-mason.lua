vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/neovim/nvim-lspconfig",
})

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

-- enable mason and configure icons
mason.setup({
	registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	},
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- lsp
mason_lspconfig.setup({
	automatic_enable = false,
	-- servers for mason to install
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"html",
		"cssls",
		"tailwindcss",
		"gopls",
		"emmet_ls",
		"emmet_language_server",
		"marksman",
		"superhtml",
		"ruff",
		"basedpyright",
	},
})
-- formatters
mason_tool_installer.setup({
	ensure_installed = {
		"prettierd",
		"prettier",
		"stylua",
		"xmlformatter",
		"biome",
		"ruff",
	},
})
