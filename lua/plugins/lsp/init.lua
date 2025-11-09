return {
	{
		"neovim/nvim-lspconfig",
		event = "LazyFile",
		opts = {
			---@type vim.diagnostic.Opts
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_lines = true,
				virtual_text = false,
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = Sentinel.config.icons.diagnostics.Error,
						[vim.diagnostic.severity.WARN] = Sentinel.config.icons.diagnostics.Warn,
						[vim.diagnostic.severity.HINT] = Sentinel.config.icons.diagnostics.Hint,
						[vim.diagnostic.severity.INFO] = Sentinel.config.icons.diagnostics.Info,
					},
				},
			},
		},
		config = vim.schedule_wrap(function(_, opts)
			vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

			for server, server_opts in pairs(opts.servers) do
				vim.lsp.config(server, server_opts)
				vim.lsp.enable(server)
			end
		end),
	},
	{ import = "plugins.lsp.languages" },
}
