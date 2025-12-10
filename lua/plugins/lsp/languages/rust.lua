if not Sentinel.executable({ "bacon", "rust-analyzer" }) then
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
				rust_analyzer = {},
			},
		},
	},
	{
		"mrcjkb/rustaceanvim",
		ft = "rust",
	},
	{
		"alexpasmantier/krust.nvim",
		ft = "rust",
	},
}
