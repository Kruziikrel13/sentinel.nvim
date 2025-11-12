if not Sentinel.executable({ "slint-lsp" }) then
	return {}
end

return {
	{
		"nvim-treesitter",
		opts = { ensure_installed = { "slint" } },
	},
	{
		"nvim-lspconfig",
		opts = {
			servers = {
				slint_lsp = {},
			},
		},
	},
}
