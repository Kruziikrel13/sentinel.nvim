return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	config = function()
		vim.diagnostic.config({
			virtual_lines = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = Sentinel.config.icons.diagnostics.Error,
					[vim.diagnostic.severity.WARN] = Sentinel.config.icons.diagnostics.Warn,
					[vim.diagnostic.severity.HINT] = Sentinel.config.icons.diagnostics.Hint,
					[vim.diagnostic.severity.INFO] = Sentinel.config.icons.diagnostics.Info,
				},
			},
		})
	end,
}
