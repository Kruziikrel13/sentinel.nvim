return {
	"saghen/blink.cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	version = "1.*",
	opts_extend = {
		"sources.default",
	},
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"saghen/blink.compat",
			optional = true, -- make optional so it's only enabled if any extra's need it
			opts = {},
			version = "*",
		},
	},
	opts = {
		completion = {
			accept = { auto_brackets = { enabled = true } },
			menu = { draw = { treesitter = { "lsp" } } },
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
		},
		keymap = {
			["<A-CR>"] = { "select_and_accept" },
			["<A-k>"] = { "select_prev" },
			["<A-j>"] = { "select_next" },
		},
	},
}
