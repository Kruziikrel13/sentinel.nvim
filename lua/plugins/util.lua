return {
	{
		"kruziikrel13/snacks.nvim",
		opts = {
			bigfile = { enabled = true },
			quickfile = { enabled = true },
		},
		keys = {
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>S",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
			{
				"<leader>dps",
				function()
					Snacks.profiler.scratch()
				end,
				desc = "Profiler Scratch Buffer",
			},
		},
	},
	-- Session management. This saves your session in the background,
	-- keeping track of open buffers, window arrangement, and more.
	-- You can restore sessions when returning through the dashboard.
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>qS", function() require("persistence").select() end,desc = "Select Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
	},
	{
		"imranzero/multiterm.nvim",
		event = "VeryLazy",
		opts = {
			-- Recommended keymaps:
			keymaps = {
				toggle = [[<C-\><C-\>]],
				list = [[<C-\>\]],
			},
			term_keys = {
				next = { "<C-Right>" },
			},
		},
	},
	-- library used by other plugins
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "ibhagwan/fzf-lua", lazy = true },
}
