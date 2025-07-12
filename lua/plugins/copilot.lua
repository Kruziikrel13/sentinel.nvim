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
				opts = {
					suggestion = { enabled = false },
					panel = { enabled = false },
					server = { type = "binary", custom_server_filepath = "copilot-language-server" },
				},
			},
			{
				"saghen/blink.cmp",
				optional = true,
				dependencies = { "fang2hou/blink-copilot", "zbirenbaum/copilot.lua", "olimorris/codecompanion.nvim" },
				opts_extend = { "sources.default" }, -- undocumented option
				opts = {
					completion = {
						ghost_text = { enabled = true },
					},
					sources = {
						default = { "copilot" },
						per_filetype = {
							codecompanion = { "codecompanion" },
						},
						providers = {
							copilot = {
								name = "copilot",
								module = "blink-copilot",
								async = true,
							},
						},
					},
				},
			},
		}
	or {}
