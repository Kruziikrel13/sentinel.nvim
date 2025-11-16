return {
	{
		---@see https://github.com/mcauley-penney/techbase.nvim
		"mcauley-penney/techbase.nvim",
		init = function()
			vim.cmd.colorscheme("techbase")
		end,
	},
	{
		"lualine.nvim",
		opts = {
			options = { theme = "techbase" },
		},
	},
}
