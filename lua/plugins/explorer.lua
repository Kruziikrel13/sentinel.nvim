return {
	"kruziikrel13/snacks.nvim",
	opts = {
		explorer = { enable = true },
		picker = {
			sources = {
				explorer = {
					icons = {
						git = {
							added = Sentinel.config.icons.git.added,
							staged = Sentinel.config.icons.git.staged,
							modified = Sentinel.config.icons.git.modified,
							deleted = Sentinel.config.icons.git.removed,
						},
					},
					win = {
						input = {
							keys = {
								["<Esc>"] = {
									function()
										vim.cmd.wincmd("p")
									end,
									mode = { "n", "i" },
								},
							},
						},
						list = {
							keys = {
								["<BS>"] = "toggle_hidden",
								["C"] = "explorer_close_all",
								["E"] = "explorer_open_all", -- From PR https://github.com/folke/snacks.nvim/pull/1652
								["c"] = "explorer_close",
								["<"] = "explorer_up",
								[">"] = "explorer_focus",
								["<C-W><C-W>"] = function()
									vim.cmd.wincmd("l")
								end,
							},
						},
					},
				},
			},
		},
	},
	keys = {
		{
			"t",
			function()
				Snacks.explorer()
			end,
			{ desc = "File Explorer" },
		},
	},
}
