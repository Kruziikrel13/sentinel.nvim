if not vim.g.ENABLE_SIDEKICK or not Sentinel.executable("copilot-language-server") then
	return {}
end

return {
	{
		"nvim-lspconfig",
		opts = {
			servers = {
				copilot = {},
			},
		},
	},
	{
		"folke/sidekick.nvim",
		opts = {
			nes = { enabled = false },
		},
		keys = {
			{ "<leader>a", "", desc = "+sidekick", mode = { "n", "v" } },
			{
				"<C-.>",
				function()
					require("sidekick.cli").toggle("copilot")
				end,
				desc = "Sidekick Toggle",
				mode = { "n", "t", "i", "x" },
			},
			{
				"<leader>aa",
				function()
					require("sidekick.cli").toggle("copilot")
				end,
				desc = "Sidekick Toggle CLI",
			},
			{
				"<leader>ap",
				function()
					require("sidekick.cli").prompt()
				end,
				mode = { "x", "n" },
				desc = "Sidekick Select Prompt",
			},
			{
				"<leader>at",
				function()
					require("sidekick.cli").send("{this}")
				end,
				desc = "Send This",
				mode = { "x", "n" },
			},
			{
				"<leader>af",
				function()
					require("sidekick.cli").send("{file}")
				end,
				desc = "Send File",
			},
			{
				"<leader>av",
				function()
					require("sidekick.cli").send("{selection}")
				end,
				desc = "Send Visual Selection",
				mode = "x",
			},
		},
	},

	{
		"snacks.nvim",
		opts = {
			picker = {
				actions = {
					sidekick_send = function(...)
						return require("sidekick.cli.picker.snacks").send(...)
					end,
				},
				win = {
					input = {
						keys = {
							["<a-a>"] = {
								"sidekick_send",
								mode = { "n", "i" },
							},
						},
					},
				},
			},
		},
	},
}
