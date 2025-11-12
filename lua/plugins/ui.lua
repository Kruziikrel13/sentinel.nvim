return {
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
		opts = {
			options = {
        -- stylua: ignore
        close_command = function (n) Snacks.bufdelete(n) end,
        -- stylua: ignore
        right_mouse_command = function (n) Snacks.bufdelete(n) end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {},
	},
	{
		"saghen/blink.indent",
		opts = {},
	},
	{
		"snacks.nvim",
		opts = {
			indent = { enabled = Sentinel.has("blink.indent") },
			input = { enabled = true },
			notifier = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = false },
			-- toggle = {}
		},
    -- stylua: ignore
		keys = {
			{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
			{ "<leader>fg", function() Snacks.picker.grep() end, desc = "Find Text" },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
			{
				"<leader>n",
				function()
					if Snacks.config.picker and Snacks.config.picker.enabled then
						Snacks.picker.notifications()
					else
						Snacks.notifier.show_history()
					end
				end,
				desc = "Notification History",
			},
		},
	},
}
