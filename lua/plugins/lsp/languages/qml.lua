if not Sentinel.executable({ "qmlls" }) then
	return {}
end

return {
	{
		"nvim-lspconfig",
		opts = {
			servers = {
				qmlls = {},
			},
		},
	},
	{
		"nvim-treesitter",
		opts = { ensure_installed = { "qmljs" } },
	},
}
