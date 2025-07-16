return (vim.g.ai and vim.fn.executable("copilot-language-server"))
		and {
			{
				"CopilotC-Nvim/CopilotChat.nvim",
				branch = "main",
				cmd = "CopilotChat",
				opts = function()
					local user = vim.env.USER or "User"
					user = user:sub(1, 1):upper() .. user:sub(2)
					return {
						auto_insert_mode = true,
						question_header = "  " .. user .. " ",
						answer_header = "  Copilot ",
						mappings = {
							reset = {
								normal = "",
								insert = "",
							},
						},
						window = {
							width = 0.4,
						},
					}
				end,
				config = function(_, opts)
					local chat = require("CopilotChat")
					vim.api.nvim_create_autocmd("BufEnter", {
						pattern = "copilot-chat",
						callback = function()
							vim.opt_local.relativenumber = false
							vim.opt_local.number = false
						end,
					})

					chat.setup(opts)
				end,
				keys = {
					{
						"<C-S>",
						"<CR>",
						ft = "copilot-chat",
						desc = "Submit Prompt",
						remap = true,
					},
					{
						"<leader>cc",
						function()
							return require("CopilotChat").toggle()
						end,
						desc = "Toggle Copilot Chat",
						mode = { "n", "v" },
					},
					{
						"<leader>cx",
						function()
							return require("CopilotChat").reset()
						end,
						desc = "Clear Copilot Chat",
						mode = { "n", "v" },
					},
					{
						"<leader>cq",
						function()
							vim.ui.input({
								prompt = "Quick Chat: ",
							}, function(input)
								if input ~= "" then
									require("CopilotChat").ask(input)
								end
							end)
						end,
						desc = "Quick Chat",
						mode = { "n", "v" },
					},
					{
						"<leader>cp",
						function()
							require("CopilotChat").select_prompt()
						end,
						desc = "Prompt Actions",
						mode = { "n", "v" },
					},
				},
			},
			{
				"zbirenbaum/copilot.lua",
				cmd = "Copilot",
				build = ":Copilot auth",
				event = "BufReadPre",
				opts = {
					suggestion = {
						enabled = true,
						auto_trigger = true,
						debounce = 200,
						keymap = { accept = "<C-CR>", next = "<C-Down>", prev = "<C-Up>" },
					},
					panel = { enabled = false },
					filetypes = {
						markdown = true,
						help = true,
					},
					server = { type = "binary", custom_server_filepath = "copilot-language-server" },
				},
			},
			{
				"folke/which-key.nvim",
				opts = {
					spec = {
						{ "<leader>c", group = "copilot", icon = { icon = "", color = "purple" } },
					},
				},
			},
		}
	or {}
