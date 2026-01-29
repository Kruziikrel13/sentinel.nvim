return {
	-- Icon handling
	{
		"nvim-mini/mini.icons",
		lazy = true,
		opts = {
			file = {
				[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
			},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
			},
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {},
	},
	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		opts = {},
	},
	-- Indent Highlighting
	{
		"saghen/blink.indent",
		opts = {},
	},
	-- File Picker
	{
		"ibhagwan/fzf-lua",
		opts = {},
		init = function()
			require("fzf-lua").register_ui_select()
		end,
    -- stylua: ignore
		keys = {
			{ "<leader>ff", function() require("fzf-lua").files() end, desc = "Find Files" },
			{ "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Find Text" },
		},
	},
	{
		"snacks.nvim",
		opts = {
			notifier = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = false },
			-- toggle = {}
		},
	},
	{
		"rachartier/tiny-glimmer.nvim",
		event = "VeryLazy",
		priority = 10,
		opts = {
			search = { enabled = true },
			undo = { enabled = true },
			redo = { enabled = true },
		},
	},
}
