---@class sentinel.util.colorscheme
local M = {}

---@type table<string, LazyPluginSpec>
local colorschemes = {
	cyberdream = {
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	github_dark_default = {
		"projekt0n/github-nvim-theme",
		opts = {
			options = {
				dim_inactive = true,
			},
		},
		config = function(_, opts)
			local github = require("github-theme")
			github.setup(opts)
			github.compile(false)
			vim.opt.background = "dark"
		end,
	},
	github_light_default = {
		"projekt0n/github-nvim-theme",
		opts = {
			options = {
				dim_inactive = true,
			},
		},
		config = function(_, opts)
			local github = require("github-theme")
			github.setup(opts)
			github.compile(false)
			vim.opt.background = "light"
		end,
	},
	rose_pine = {
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	},
	github_base16_dark = {
		"y3owk1n/base16-pro-max.nvim",
		name = "base16-pro-max",
		priority = 1000,
		opts = {
			colors = {
				base00 = "#161b22",
				base01 = "#30363d",
				base02 = "#484f58",
				base03 = "#6e7681",
				base04 = "#8b949e",
				base05 = "#c9d1d9",
				base06 = "#f0f6fc",
				base07 = "#ffffff",
				base08 = "#f85149",
				base09 = "#db6d28",
				base0A = "#bb8009",
				base0B = "#2ea043",
				base0C = "#2A9D9A",
				base0D = "#388bfd",
				base0E = "#a371f7",
				base0F = "#3D2F00",
			},
			plugins = {
				enable_all = true,
			},
			setup_globals = {
				terminal_colors = true,
				base16_gui_colors = true,
			},
		},
	},
}

local colorscheme
function M.setup()
	local theme = Sentinel.config.colorscheme
	if colorschemes[theme] ~= nil then
		colorscheme = colorschemes[theme]
		colorscheme = vim.tbl_deep_extend("keep", colorscheme, {
			name = theme,
		})
	end
end

function M.enable()
	Sentinel.track("colorscheme")
	Sentinel.try(function()
		vim.cmd.colorscheme(colorscheme.name)
	end, {
		msg = "Could not load your colorscheme",
		on_error = function(msg)
			Sentinel.error(msg)
			vim.cmd.colorscheme("habamax")
		end,
	})
	Sentinel.track()
end

setmetatable(M, {
	__call = function()
		if colorscheme ~= nil then
			return colorscheme
		end
		return {}
	end,
})

return M
