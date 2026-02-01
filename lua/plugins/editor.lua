return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts_extend = { "spec" },
		opts = {
			preset = "helix",
			defaults = {},
			spec = {
				{
					mode = { "n", "v" },
					{ "<leader>f", group = "file/find" },
					{ "<leader>q", group = "quit/session" },
					{ "<leader>u", group = "utilities" },
					{ "<leader>b", group = "buffers" },
					{ "<leader>w", group = "windows" },
					{ "<leader><Tab>", group = "tabs" },
					{ "[", group = "prev" },
					{ "]", group = "next" },
					{ "g", group = "goto" },
					{ "gs", group = "surround" },
				},
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Keymaps (which-key)",
			},
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "LazyFile",
		opts = {
			current_line_blame = true,
		},
	},

	{
		"which-key.nvim",
		opts = {
			spec = {
				{ "<leader>g", group = "git" },
			},
		},
	},

	{
		"qwavies/smart-backspace.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
	},

	{
		"folke/todo-comments.nvim",
		event = "LazyFile",
		opts = {},
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next Todo Comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous Todo Comment",
			},
		},
	},
}
