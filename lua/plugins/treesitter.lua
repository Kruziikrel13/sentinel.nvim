return {
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<BS>", desc = "Decrement Selection", mode = "x" },
				{ "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		init = function(plugin)
			require("lazy.core.loader").add_to_rtp(plugin)
		end,
		config = function(_, opts)
			require("nvim-treesitter").setup(opts)
			require("nvim-treesitter").install({
				"c",
				"cpp",
				"lua",
				"nix",
				"typescript",
				"javascript",
			})
		end,
	},

	-- Automatically add closing tags for HTML and JSX
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {},
	},
}
