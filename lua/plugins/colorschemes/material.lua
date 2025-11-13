return {
	---@see https://github.com/marko-cerovac/material.nvim
	"marko-cerovac/material.nvim",
	opts = {},
	config = function(_, opts)
		require("material").setup(opts)

		if vim.o.background == "light" then
			vim.g.material_style = "lighter"
		else
			vim.g.material_style = "darker"
		end

		vim.cmd.colorscheme("material")
	end,
}
