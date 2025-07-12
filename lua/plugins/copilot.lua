return (vim.g.ai and vim.fn.executable("copilot-language-server"))
		and {
			{
				"olimorris/codecompanion.nvim",
				cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionCmd", "CodeCompanionChat" },
				opts = {
					strategies = {
						chat = {
							adapter = "copilot",
						},
						inline = {
							adapter = "copilot",
						},
					},
				},
			},
			{
				"zbirenbaum/copilot.lua",
				cmd = "Copilot",
				build = ":Copilot auth",
				event = "InsertEnter",
				opts = {
					suggestion = {
						enabled = true,
						debounce = 100,
						auto_trigger = true,
						hide_during_completion = true,
						keymap = { accept = "<C-CR>", next = "<C-J>", prev = "<C-K>" },
					},
					panel = { enabled = false },
					server = { type = "binary", custom_server_filepath = "copilot-language-server" },
				},
				init = function()
					vim.api.nvim_create_autocmd("User", {
						pattern = "BlinkCmpMenuOpen",
						callback = function()
							vim.b.copilot_suggestion_hidden = true
						end,
					})
					vim.api.nvim_create_autocmd("User", {
						pattern = "BlinkCmpMenuClose",
						callback = function()
							vim.b.copilot_suggestion_hidden = false
						end,
					})
				end,
			},
			{
				"saghen/blink.cmp",
				optional = true,
				opts = {
					completion = {
						menu = {
							auto_show = false,
						},
					},
					keymap = {
						["<A-CR>"] = { "select_and_accept", "show" },
					},
				},
			},
		}
	or {}
