return {
	{
		"DrKJeff16/project.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
		},
		opts = {},
	},
	{
		"nvim-tree/nvim-tree.lua",
		optional = true,
		opts = {
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
		},
	},
}
