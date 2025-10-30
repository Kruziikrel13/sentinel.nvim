---@class sentinel.util.colorscheme
local M = {}

local function is_mode(mode)
	return vim.o.background == mode
end

---@type table<string, LazyPluginSpec>
M._colorschemes = {
	github = {
		-- https://github.com/projekt0n/github-nvim-theme
		"projekt0n/github-nvim-theme",
		opts = {
			options = {
				terminal_colors = true,
				dim_inactive = true,
			},
		},
		config = function(_, opts)
			local github = require("github-theme")
			github.setup(opts)
			github.compile(true)

			if is_mode("light") then
				vim.cmd.colorscheme("github_light_default")
			else
				vim.cmd.colorscheme("github_dark_default")
			end
		end,
	},

	material = {
		-- https://github.com/marko-cerovac/material.nvim
		"marko-cerovac/material.nvim",
		opts = {},
		config = function(_, opts)
			require("material").setup(opts)

			if is_mode("light") then
				vim.g.material_style = "lighter"
			else
				vim.g.material_style = "darker"
			end

			vim.cmd.colorscheme("material")
		end,
	},

	miasma = {
		-- https://github.com/xero/miasma.nvim
		"xero/miasma.nvim",
		config = function()
			vim.cmd.colorscheme("miasma")
		end,
	},

	mellifluous = {
		-- https://github.com/ramojus/mellifluous.nvim
		"ramojus/mellifluous.nvim",
		opts = {},
		config = function(_, opts)
			require("mellifluous").setup(opts)
			vim.cmd.colorscheme("mellifluous")
		end,
	},
}

M._colorscheme = nil

function M.setup()
	local name = Sentinel.config.colorscheme

	if M._colorschemes[name] ~= nil then
		M._colorscheme = M._colorschemes[name]
		M._colorscheme = vim.tbl_deep_extend("keep", M._colorscheme, {
			lazy = false,
			priority = 1000,
		})
	else
	end
end

setmetatable(M, {
	__call = function()
		if M._colorscheme ~= nil then
			return M._colorscheme
		end
		return {}
	end,
})

return M
