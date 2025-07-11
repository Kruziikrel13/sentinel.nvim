return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		cmd = "LazyDev",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				Sentinel.has("snacks.nvim") and { path = "snacks.nvim", words = { "Snacks" } } or nil,
			},
		},
		config = function(_, opts)
			vim.lsp.enable("lua_ls")
			require("lazydev").setup(opts)
		end,
	},
	{
		"saghen/blink.cmp",
		optional = true,
		opts = {
			sources = {
				per_filetype = {
					lua = { inherit_defaults = true, "lazydev" },
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},
}
