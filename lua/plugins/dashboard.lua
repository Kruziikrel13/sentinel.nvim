return {
	{ "kruziikrel13/snacks.nvim", opts = { dashboard = { enabled = false } } },
	{
		"goolord/alpha-nvim",
		dependencies = { "MaximilianLloyd/ascii.nvim" },
		event = "VimEnter",
		init = false,
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			local ascii_categories = {
				{ "computers", "apple" },
				{ "computers", "atari" },
				{ "computers", "linux" },
				{ "computers", "consoles" },
				{ "gaming", "doom" },
				{ "gaming", "pacman" },
				{ "misc", "skulls" },
			}
			math.randomseed(os.time() + math.random(1, 1000))
			local category = ascii_categories[math.random(1, #ascii_categories)]
			dashboard.section.header.val = require("ascii").get_random(unpack(category))

			dashboard.section.buttons.val = {
				dashboard.button("f", " " .. " Find file", "<cmd>lua Snacks.picker.files()<cr>"),
				dashboard.button("n", " " .. " New file", "<cmd>ene <BAR> startinsert <cr>"),
				dashboard.button("r", " " .. " Recent files", "<cmd>lua Snacks.picker.recent()<cr>"),
				dashboard.button("g", " " .. " Find text", "<cmd>lua Snacks.picker.grep()<cr>"),
				dashboard.button("s", " " .. " Restore Session", "<cmd>lua require('persistence').load()<cr>"),
				dashboard.button("l", "󰒲 " .. " Lazy", "<cmd>Lazy<cr>"),
				dashboard.button("q", " " .. " Quit", "<cmd>qa<cr>"),
			}

			-- vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#311B92" })
			vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#D1C4E9" })
			vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#8BC34A" })
			vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#edd691" })

			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end
			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.section.footer.opts.hl = "AlphaFooter"
			dashboard.opts.layout[1].val = 3
			return dashboard
		end,
		config = function(_, dashboard)
			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					once = true,
					pattern = "AlphaReady",
					callback = function()
						require("lazy").show()
					end,
				})
			end
			require("alpha").setup(dashboard.opts)
		end,
	},
}
