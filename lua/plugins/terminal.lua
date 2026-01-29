return {
	"waiting-for-dev/ergoterm.nvim",
	opts = {},
	config = function(_, opts)
		local ergoterm = require("ergoterm")
		ergoterm.setup(opts)

		ergoterm:new({
			name = "default",
			layout = "below",
			auto_scroll = true,
			sticky = true,
			size = {
				below = "30%",
			},
		})
	end,

	keys = {
		{
			"<C-\\><C-\\>",
			function()
				require("ergoterm").get_by_name("default"):toggle()
			end,
			desc = "Terminal",
			mode = { "x", "n", "t" },
		},
	},
}
