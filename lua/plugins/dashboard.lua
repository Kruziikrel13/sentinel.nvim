Sentinel.on_load("snacks.nvim", function()
	-- Create highlights when snacks.nvim loads
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#641220" })
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#6e1423" })
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#85182a" })
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#a11d33" })
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#a71e34" })
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#b21e35" })
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo7", { fg = "#bd1f36" })
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo8", { fg = "#c71f37" })
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo9", { fg = "#da1e37" })
end)

local dashboard_icon = {
	{ "        .*-.       \n", hl = "NeovimDashboardLogo1" },
	{ "    -:   @+  .=    \n", hl = "NeovimDashboardLogo1" },
	{ "  .*-    @=    #-  \n", hl = "NeovimDashboardLogo2" },
	{ " +@-     @=     %*.\n", hl = "NeovimDashboardLogo2" },
	{ "=@%:     @=     *@*\n", hl = "NeovimDashboardLogo3" },
	{ " .+@#.   @=   =@*: \n", hl = "NeovimDashboardLogo3" },
	{ "    =%*. @= -%*.   \n", hl = "NeovimDashboardLogo4" },
	{ "      =%*@##+.     \n", hl = "NeovimDashboardLogo4" },
	{ "       =@@@%-      \n", hl = "NeovimDashboardLogo5" },
	{ "     +@#:@*=%#:    \n", hl = "NeovimDashboardLogo5" },
	{ "  .+@%-  @+  =@#-  \n", hl = "NeovimDashboardLogo6" },
	{ ".+@%-    @+   .+@#:\n", hl = "NeovimDashboardLogo6" },
	{ "=@@=     @+    :#@*\n", hl = "NeovimDashboardLogo7" },
	{ "  =%%-   @+  .*@*. \n", hl = "NeovimDashboardLogo7" },
	{ "    =%%- @+ +@#:   \n", hl = "NeovimDashboardLogo8" },
	{ "      =%%@%@#:     \n", hl = "NeovimDashboardLogo8" },
	{ "        -#*:       ", hl = "NeovimDashboardLogo9" },
}

return {
	"kruziikrel13/snacks.nvim",
	opts = {
		dashboard = {
			enable = true,
			row = 6,
			sections = {
				{
					{ section = "header", align = "center" },
					{ section = "keys", gap = 1, padding = 1 },
				},
				function()
					if not Snacks.git.get_root() then
						return
					end

					local gh = {
						{
							title = "Notifications",
							indent = 3,
							height = 5,
							key = "N",
							ttl = 5 * 60,
							cmd = "gh notify -s -n5",
							action = function()
								vim.ui.open("https://github.com/notifications")
							end,
						},
						{
							title = "Open Issues",
							indent = 3,
							height = 7,
							key = "I",
							ttl = 5 * 60,
							cmd = "gh issue list -L 3",
							action = function()
								vim.fn.jobstart("gh issue list --web", { detach = true })
							end,
						},
						{
							title = "Open PRs",
							indent = 3,
							height = 7,
							key = "P",
							ttl = 5 * 60,
							cmd = "gh pr list -L 3",
							action = function()
								vim.fn.jobstart("gh pr list --web", { detach = true })
							end,
						},
					}

					local sections = {
						{
							icon = "",
							title = "Browse Repo",
							key = "b",
							action = function()
								---@diagnostic disable-next-line: missing-fields
								Snacks.gitbrowse({
									what = "repo",
								})
							end,
						},
						{
							icon = "",
							title = "Git Status",
							indent = 3,
							height = 5,
							ttl = 5 * 60,
							cmd = "git --no-pager diff --stat -B -M -C",
							section = "terminal",
						},
					}

					if vim.fn.executable("gh") == 1 then
						gh = vim.tbl_map(function(cmd)
							return vim.tbl_extend("keep", cmd, {
								section = "terminal",
							})
						end, gh)
						table.insert(sections, gh)
					end

					return vim.tbl_map(function(cmd)
						return vim.tbl_extend("keep", cmd, {
							pane = 2,
							padding = 1,
						})
					end, sections)
				end,
				{ section = "startup" },
			},
			preset = { header = dashboard_icon },
		},
	},
	keys = {
		{
			"<leader>D",
			function()
				Snacks.dashboard.open()
			end,
			desc = "Dashboard",
		},
	},
}
