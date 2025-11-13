return {
	---@see https://github.com/ramojus/mellifluous.nvim
	"ramojus/mellifluous.nvim",
	opts = {},
	config = function(_, opts)
		require("mellifluous").setup(opts)
		vim.cmd.colorscheme("mellifluous")
	end,
}
