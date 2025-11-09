return {
	"snacks.nvim",
	keys = {
		{
			"<C-\\><C-\\>",
			function()
				Snacks.terminal()
			end,
			desc = "Terminal",
			mode = { "n", "x", "t" },
		},
	},
}
