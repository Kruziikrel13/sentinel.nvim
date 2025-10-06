return {
	"A7Lavinraj/fyler.nvim",
	dependencies = "nvim-mini/mini.icons",
	opts = {
		close_on_select = false,
		default_explorer = true,
		git_status = {
			symbols = {
				Modified = Sentinel.config.icons.git.modified,
				Added = Sentinel.config.icons.git.staged,
				Deleted = Sentinel.config.icons.git.removed,
				Untracked = Sentinel.config.icons.git.untracked,
			},
		},
		mappings = {
			["<C-v>"] = "SelectVSplit",
			["<C-x>"] = "SelectSplit",
			["<"] = "GotoParent",
			[">"] = "GotoNode",
			["c"] = "CollapseNode",
			["C"] = "CollapseAll",
		},
	},
	keys = {
		{
			"t",
			function()
				require("fyler").toggle({
					kind = "split_left_most",
				})
			end,
			desc = "Explorer",
		},
	},
}
