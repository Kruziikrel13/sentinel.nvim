local snacks_keys = {
	{
		"<leader>gf",
		function()
			Snacks.picker.git_log_file()
		end,
		desc = "Git Current File History",
	},
	{
		"<leader>gl",
		function()
			Snacks.picker.git_log()
		end,
		desc = "Git Log",
	},
	{
		"<leader>gb",
		function()
			Snacks.gitbrowse()
		end,
		desc = "Git Browse",
	},
	{
		"<leader>gB",
		function()
			Snacks.gitbrowse({ what = "repo" })
		end,
		desc = "Git Browse",
	},
}

-- Enable lazygit and add keybinding if lazygit is present
if vim.fn.executable("lazygit") == 1 then
	table.insert(snacks_keys, {
		"<leader>gg",
		function()
			Snacks.lazygit()
		end,
		desc = "LazyGit",
	})
end

return {
	{
		"folke/snacks.nvim",
		opts = {
			lazygit = { enable = vim.fn.executable("lazygit") == 1 },
		},
		keys = snacks_keys,
	},
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<leader>g", group = "git" },
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre", "BufEnter" },
		opts = { current_line_blame = true },
	},
}
