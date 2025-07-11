return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts = {
		signature = { enabled = true },
		completion = {
			accept = { auto_brackets = { enabled = true } },
			menu = { draw = { treesitter = { "lsp" } } },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		keymap = {
			["<A-CR>"] = { "select_and_accept" },
			["<A-k>"] = { "select_prev" },
			["<A-j>"] = { "select_next" },
		},
	},
}
