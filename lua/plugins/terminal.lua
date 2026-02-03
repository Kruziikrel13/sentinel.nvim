-- Terminal util hard depends on this
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

		Sentinel.terminal.lazygit_setup()
		ergoterm:new({
			name = "git",
			cmd = "lazygit",
			layout = "float",
			sticky = true,
			float_winblend = 0,
			watch_files = true,
			on_close = function()
				vim.defer_fn(function()
					vim.cmd.stopinsert()
				end, 150)
			end,
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
		{
			"<leader>gg",
			function()
				require("ergoterm").get_by_name("git"):toggle()
			end,
			desc = "Git",
		},
	},
}
