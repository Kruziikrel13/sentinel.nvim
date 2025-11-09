if not Sentinel.executable("bacon") then
	return {}
end

return {
	{
		"nvim-treesitter",
		opts = { ensure_installed = { "rust", "ron" } },
	},
	{
		"nvim-lspconfig",
		opts = {
			servers = {
				bacon_ls = {},
			},
		},
	},
	{
		"mrcjkb/rustaceanvim",
		ft = "rust",
	},
}
