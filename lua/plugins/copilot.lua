return vim.g.ai
		and {
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
				dependencies = { "fang2hou/blink-copilot", "zbirenbaum/copilot.lua" },
				opts_extend = { "sources.default" },
				opts = {
					completion = {
						ghost_text = { enabled = true },
					},
					sources = {
						default = { "copilot" },
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
