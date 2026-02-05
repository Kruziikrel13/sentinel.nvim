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
		"linrongbin16/gitlinker.nvim",
		opts = {
			router = {
				default_branch = {
					-- example: https://github.com/linrongbin16/gitlinker.nvim/blob/master/lua/gitlinker.lua#L3-L4
					["^github%.com"] = "https://github.com/" .. "{_A.ORG}/" .. "{_A.REPO}",
					["^gitlab%.com"] = "https://gitlab.com/" .. "{_A.ORG}/" .. "{_A.REPO}",
				},
				current_branch = {
					-- example: https://github.com/linrongbin16/gitlinker.nvim/blob/master/lua/gitlinker.lua#L3-L4
					["^github%.com"] = "https://github.com/"
						.. "{_A.ORG}/"
						.. "{_A.REPO}/tree/"
						.. "{_A.CURRENT_BRANCH}/",
					["^gitlab%.com"] = "https://gitlab.com/"
						.. "{_A.ORG}/"
						.. "{_A.REPO}/tree/"
						.. "{_A.CURRENT_BRANCH}/",
				},
			},
		},

		keys = {
			{ "<leader>gb", "<CMD>GitLink! default_branch<CR>", desc = "Open In Browser" },
			{ "<leader>gc", "<CMD>GitLink! current_branch<CR>", desc = "Open Current Branch In Browser" },
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
		"jameswolensky/marker-groups.nvim",
		cmd = {
			"MarkerGroupsCreate",
			"MarkerAdd",
		},
		opts = { picker = "fzf-lua", keymaps = { enabled = false } },
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required
			"ibhagwan/fzf-lua", -- Optional: fzf-lua picker
		},
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
