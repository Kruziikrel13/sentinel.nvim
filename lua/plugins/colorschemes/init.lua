local DEFAULT = "github"
local THEME = "dark"

vim.g.EDITOR_THEME = vim.g.EDITOR_THEME or DEFAULT
vim.o.background = vim.o.background or THEME

local colorscheme = require("plugins.colorschemes." .. vim.g.EDITOR_THEME)
colorscheme = vim.tbl_deep_extend("force", colorscheme, {
	lazy = false,
	priority = 1000,
})

return colorscheme
