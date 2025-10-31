if vim.fn.has("nvim-0.12") == 0 then
	return {}
end

vim.g.ai_cmp = false
local status = {}

return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			copilot = {
				keys = {
					{},
				},
			},
		},
	},
}
