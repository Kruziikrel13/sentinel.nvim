return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		config = function()
			vim.diagnostic.config({
				virtual_lines = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = Sentinel.config.icons.diagnostics.Error,
						[vim.diagnostic.severity.WARN] = Sentinel.config.icons.diagnostics.Warn,
						[vim.diagnostic.severity.HINT] = Sentinel.config.icons.diagnostics.Hint,
						[vim.diagnostic.severity.INFO] = Sentinel.config.icons.diagnostics.Info,
					},
				},
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		cmd = "LazyDev",
		opts = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			{ path = "snacks.nvim", words = { "Snacks" } },
		},
		config = function(_, opts)
			vim.lsp.enable("lua_ls")
			require("lazydev").setup(opts)
		end,
	},
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
}
