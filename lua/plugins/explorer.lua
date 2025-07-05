return {
	"kruziikrel13/snacks.nvim",
	opts = {
		explorer = { enable = true },
		picker = {
			sources = {
				explorer = {
					matcher = { fuzzy = true },
					icons = {
						},
					},
					win = {
						list = {
							keys = {
								["<BS>"] = "toggle_hidden",
								["C"] = "explorer_close_all",
								["E"] = "explorer_open_all",
								["c"] = "explorer_close",
								["<"] = "explorer_up",
								[">"] = "explorer_focus",
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
