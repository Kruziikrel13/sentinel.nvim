return {
	-- https://github.com/projekt0n/github-nvim-theme
	"projekt0n/github-nvim-theme",
	opts = {
		options = {
			terminal_colors = true,
			dim_inactive = true,
		},
	},
	config = function(_, opts)
		local theme = require("github-theme")
		theme.setup(opts)
		theme.compile(true)

		if vim.o.background == "light" then
			vim.cmd.colorscheme("github_light_default")
		else
			vim.cmd.colorscheme("github_dark_default")
		end
	end,
}
