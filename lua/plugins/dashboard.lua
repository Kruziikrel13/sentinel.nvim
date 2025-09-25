return {
	"nvim-mini/mini.starter",
	version = false,
	opts = {
		evaluate_single = true,
		query_updaters = "abcdefghilmnopqrsuvwxyz0123456789_-.",
		items = {
			{
				name = "Find Text",
				action = function()
					Snacks.picker.grep()
				end,
				section = "Files",
			},
			{
				name = "Find File",
				action = function()
					Snacks.picker.files()
				end,
				section = "Files",
			},
			{
				name = "Session Restore",
				action = function()
					require("persistence").load()
				end,
				section = "Custom Section",
			},
			{
				name = "Git Interface",
				action = function()
					Snacks.lazygit()
				end,
				section = "Custom Section",
			},
			{
				name = "Lazy",
				action = function()
					require("lazy").home()
				end,
				section = "Custom Section",
			},
			function()
				if not Sentinel.has("project.nvim") then
					return nil
				end
				return {
					name = "Projects",
					action = function()
						require("project").run_fzf_lua()
					end,
					section = "Custom Section",
				}
			end,
			function()
				return require("mini.starter").sections.builtin_actions()
			end,
		},
		footer = function()
			local stats = require("lazy.stats").stats()
			local icon = "⚡ "

			return icon .. "Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins"
		end,
	},
}
