if not vim.g.ENABLE_SIDEKICK or not Sentinel.executable("copilot-language-server") then
	return {}
end

return {
	{
		"nvim-lspconfig",
		opts = {
			servers = {
				copilot = {},
			},
		},
	},
	{
		"folke/sidekick.nvim",
		opts = {},
	},
}
