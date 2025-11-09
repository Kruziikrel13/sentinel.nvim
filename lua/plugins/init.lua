if vim.fn.has("nvim-0.12.0") == 0 then
	vim.api.nvim_echo({
		{ "Sentinel requires Neovim >= 0.12.0\n", "ErrorMsg" },
		{ "Press any key to exit", "MoreMsg" },
	}, true, {})
	vim.fn.getchar()
	vim.cmd([[quit]])
	return {}
end

require("config").init()

return {
	{ "folke/lazy.nvim", version = false },
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {},
	},
}
