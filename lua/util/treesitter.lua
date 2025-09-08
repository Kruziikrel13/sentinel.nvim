---@class sentinel.util.treesitter
local M = {}

M.parsers = {
	"bash",
	"c",
	"cpp",
	"qmljs",
	"qmldir",
	"typescript",
	"javascript",
	"tsx",
	"toml",
	"jsdoc",
	"lua",
	"luadoc",
	"regex",
	"nix",
}

function M.setup()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = {
			"c",
			"cpp",
			"lua",
			"toml",
			"sh",
			"h",
			"hpp",
			"ts",
			"tsx",
			"js",
			"jsx",
			"qml",
			"nix",
		},
		callback = function(args)
			vim.treesitter.start(args.buf)
			vim.bo[args.buf].syntax = "on"
		end,
	})
end

return M
