return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format Buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			nix = { "alejandra", "statix" },
		},
		default_format_opts = {
			timeout_ms = 3000,
			quiet = false,
			lsp_format = "fallback",
		},
		format_on_save = { timeout_ms = 500 },
	},
}
