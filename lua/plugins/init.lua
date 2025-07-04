if vim.fn.has("nvim-0.11.0") == 0 then
	vim.api.nvim_echo({
		{ "Sentinel requires Neovim >= 0.11.0\n", "ErrorMsg" },
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
		"kruziikrel13/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {},
		keys = {
			{ "<leader>L", "<CMD>Lazy<CR>", desc = "Lazy" },
		},
		config = function(_, opts)
			local notify = vim.notify
			require("snacks").setup(opts)
			-- HACK: restore vim.notify after snacks setup and let noice.nvim take over
			-- this is needed to have early notifications show up in noice history
			if Sentinel.has("noice.nvim") then
				vim.notify = notify
			end
		end,
	},
}
