return {
	"seblyng/roslyn.nvim",
	---@module 'roslyn.config'
	---@type RoslynNvimConfig
	opts = {
		filewatching = "roslyn",
	},

	init = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("disable_roslyn_semantic_tokens", { clear = true }),

			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)

				if not client then
					return
				end

				if client.name == "roslyn" or client.name == "roslyn_ls" then
					vim.lsp.semantic_tokens.enable(false, {
						bufnr = args.buf,
						client_id = client.id,
					})
				end
			end,
		})
	end,
}
