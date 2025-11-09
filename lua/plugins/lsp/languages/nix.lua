if not Sentinel.executable("nil") then
	return {}
end

return {
	{
		"nvim-treesitter",
		opts = { ensure_installed = { "nix" } },
	},
	{
		"nvim-lspconfig",
		opts = {
			servers = {
				nil_ls = {},
			},
		},
	},
	{
		"conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				nix = { "nixfmt" },
			},
		},
	},
	{
		"nvim-lint",
		optional = true,
		opts = {
			linters_by_ft = {
				nix = { "statix" },
			},
		},
	},
}
