return {
	{
		"nvim-mini/mini.pairs",
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			-- skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			-- skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },
			-- skip autopair when next character is closing pair
			-- and there are more closing pairs than opening pairs
			skip_unbalanced = true,
			-- better deal with markdown code blocks
			markdown = true,
		},
	},

	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{
		"boydaihungst/lspsaga.nvim",
		event = "LspAttach",
		opts = {
			code_action = {
				keys = {
					quit = { "<Esc>", "q" },
				},
			},
			finder = {
				keys = {
					vsplit = "<C-v>",
					split = "<C-x>",
					toggle_or_open = "<CR>",
				},
			},
			rename = {
				keys = {
					quit = { "<Esc>", "q" },
					select = "e",
				},
			},
			lightbulb = {
				sign = false,
			},
		},
		keys = {
			{ "<Tab><Tab>", "<CMD>Lspsaga hover_doc<CR>", desc = "Hover Doc" },
			{ "<Tab>r", "<CMD>Lspsaga rename<CR>", desc = "Hover Doc" },
			{ "<Tab>d", "<CMD>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
			{ "<Tab>f", "<CMD>Lspsaga finder<CR>", desc = "Find" },
			{ "<Tab>a", "<CMD>Lspsaga code_action<CR>", desc = "Code Actions" },
			{ "<leader>xx", "<CMD>Lspsaga show_workspace_diagnostics ++float<CR>", desc = "Workspace diagnostics" },
			{ "<leader>xj", "<CMD>Lspsaga diagnostic_jump_next<CR>", desc = "Jump to next diagnostic" },
			{ "<leader>xk", "<CMD>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump to prev diagnostic" },
		},
	},

	{
		"which-key.nvim",
		opts = {
			spec = {
				{ "<Tab>", group = "lsp" },
				{ "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
			},
		},
	},

	{ import = "plugins.coding.completions" },
	{ import = "plugins.coding.lazy" },
}
