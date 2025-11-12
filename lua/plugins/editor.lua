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
					{ "[", group = "prev" },
					{ "]", group = "next" },
					{ "g", group = "goto" },
					{ "gs", group = "surround" },
				},
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
		"snacks.nvim",
		keys = function()
			local res = {
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
					desc = "Git Browse (Repo)",
				},
			}

			if vim.fn.executable("lazygit") == 1 then
				table.insert(res, {
					"<leader>gg",
					function()
						Snacks.lazygit()
					end,
					desc = "LazyGit",
				})
			end

			if vim.fn.executable("gh") == 1 then
				res = vim.tbl_deep_extend("force", res, {
					{
						"<leader>gi",
						function()
							Snacks.picker.gh_issue()
						end,
						desc = "GitHub Issues (Open)",
					},
					{
						"<leader>gI",
						function()
							Snacks.picker.gh_issue({ state = "all" })
						end,
						desc = "GitHub Issues (All)",
					},
					{
						"<leader>gp",
						function()
							Snacks.picker.gh_pr()
						end,
						desc = "GitHub Pull Requests (Open)",
					},
					{
						"<leader>gP",
						function()
							Snacks.picker.gh_pr({ state = "all" })
						end,
						desc = "GitHub Pull Requests (All)",
					},
				})
			end
			return res
		end,
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

	{
		"ellisonleao/carbon-now.nvim",
		cmd = "CarbonNow",
		opts = {},
		keys = {
			{ "<leader>uS", ":CarbonNow<CR>", desc = "Screenshot Code", mode = { "n", "v" } },
		},
	},
}
