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
		lazy = vim.fn.argc(-1) == 0,
		build = ":TSUpdate",
		opts = {},
		config = function(_, opts)
			require("nvim-treesitter").install({
				"bash",
				"c",
				"qmljs",
				"typescript",
				"lua",
				"luadoc",
				"regex",
				"nix",
			})
		end,
	},
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	branch = "main",
	-- 	version = false,
	-- 	build = ":TSUpdate",
	-- 	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	-- 	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	-- 	lazy = vim.fn.argc(-1) == 0,
	-- 	init = function(plugin)
	-- 		require("lazy.core.loader").add_to_rtp(plugin)
	-- 		require("nvim-treesitter.query_predicates")
	-- 	end,
	-- 	keys = {
	-- 		{ "<c-space>", desc = "Increment Selection" },
	-- 		{ "<bs>", desc = "Decrement Selection", mode = "x" },
	-- 	},
	-- 	opts_extend = { "ensure_installed" },
	-- 	---@type TSConfig
	-- 	---@diagnostic disable-next-line: missing-fields
	-- 	opts = {
	-- 		highlight = { enable = true, disable = { "md", "markdown" } },
	-- 		indent = { enable = true },
	-- 		ensure_installed = {
	-- 			"bash",
	-- 			"c",
	-- 			"diff",
	-- 			"html",
	-- 			"javascript",
	-- 			"jsdoc",
	-- 			"json",
	-- 			"jsonc",
	-- 			"lua",
	-- 			"luadoc",
	-- 			"luap",
	-- 			"printf",
	-- 			"python",
	-- 			"query",
	-- 			"regex",
	-- 			"toml",
	-- 			"tsx",
	-- 			"typescript",
	-- 			"vim",
	-- 			"vimdoc",
	-- 			"xml",
	-- 			"yaml",
	-- 		},
	-- 		incremental_selection = {
	-- 			enable = true,
	-- 			keymaps = {
	-- 				init_selection = "<C-space>",
	-- 				node_incremental = "<C-space>",
	-- 				scope_incremental = false,
	-- 				node_decremental = "<bs>",
	-- 			},
	-- 		},
	-- 		textobjects = {
	-- 			move = {
	-- 				enable = true,
	-- 				goto_next_start = {
	-- 					["]f"] = "@function.outer",
	-- 					["]c"] = "@class.outer",
	-- 					["]a"] = "@parameter.inner",
	-- 				},
	-- 				goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
	-- 				goto_previous_start = {
	-- 					["[f"] = "@function.outer",
	-- 					["[c"] = "@class.outer",
	-- 					["[a"] = "@parameter.inner",
	-- 				},
	-- 				goto_previous_end = {
	-- 					["[F"] = "@function.outer",
	-- 					["[C"] = "@class.outer",
	-- 					["[A"] = "@parameter.inner",
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	---@param opts TSConfig
	-- 	config = function(_, opts)
	-- 		if type(opts.ensure_installed) == "table" then
	-- 			opts.ensure_installed = Sentinel.dedup(opts.ensure_installed)
	-- 		end
	-- 		require("nvim-treesitter.configs").setup(opts)
	-- 	end,
	-- },

	-- Automatically add closing tags for HTML and JSX
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {},
	},
}
