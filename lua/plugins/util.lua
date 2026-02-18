return {
	{
		"olimorris/persisted.nvim",
		lazy = false,
		opts = {
			autoload = true,
		},
    -- stylua: ignore
		keys = {
			{ "<leader>qs", function() require("persisted").load() end, desc = "Restore Session" },
			{ "<leader>qS", function() require("persisted").select() end, desc = "Select Session" },
			{ "<leader>ql", function() require("persisted").load({ last = true }) end, desc = "Restore Last Session" },
			{ "<leader>qd", function() require("persisted").stop() end, desc = "Don't Save Current Session" },
		},
	},

	{ "nvim-lua/plenary.nvim", lazy = true },
}
