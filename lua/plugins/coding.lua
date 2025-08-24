return {
	{
		"kruziikrel13/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", optional = true },
		},
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
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<Tab>", group = "lsp" },
				{ "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
			},
		},
	},
	{
		"Owen-Dechow/videre.nvim",
		cmd = "Videre",
		ft = { "yaml", "toml", "xml", "json" },
		dependencies = {
			"Owen-Dechow/graph_view_yaml_parser", -- Optional: add YAML support
			"Owen-Dechow/graph_view_toml_parser", -- Optional: add TOML support
			"a-usr/xml2lua.nvim", -- Optional | Experimental: add XML support
		},
		opts = {
			round_units = false,
			simple_statusline = false, -- If you are just starting out with Videre,
			--   setting this to `false` will give you
			--   descriptions of available keymaps.
		},
	},
}
