return {
	"nvim-mini/mini.nvim",
	version = false,
	lazy = true,
	event = "VeryLazy",
	config = function()
		-- Comment toggling (gc, gb, etc.)
		require("mini.comment").setup()
		-- Surround (add/delete/change surrounding characters)
		require("mini.surround").setup()
		-- Show git diffs and hunks
		require("mini.diff").setup({
			view = {
				style = "sign",
				signs = { add = "▎", change = "▎", delete = "▁" },
				priority = 199,
			},
		})
		-- Handle notifications
		require("mini.notify").setup({
			content = {
				-- Filter out or reorder notifications simultaneously shown
				sort = function(notif_arr)
					local filtered = {}
					for _, notif in ipairs(notif_arr) do
						-- skip "No information available" messages
						if
							not notif.msg:find("No information available")
							and not notif.msg:find("No code actions available")
						then
							table.insert(filtered, notif)
						end
					end

					-- Sort remaining notifications (newest first)
					table.sort(filtered, function(a, b)
						return a.ts_add > b.ts_add
					end)

					return filtered
				end,
			},
			lsp_progress = {
				enable = false,
			},
		})
	end,
}
