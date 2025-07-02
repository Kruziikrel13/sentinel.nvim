local lazygit_spec = {}
if vim.fn.executable("lazygit") == 1 then
	lazygit_spec = {
		"kruziikrel13/snacks.nvim",
		opts = { lazygit = { enable = true } },
		keys = {
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "LazyGit",
			},
		},
	}
end
return {
	lazygit_spec,
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre", "BufEnter" },
		opts = { current_line_blame = true },
	},
}
