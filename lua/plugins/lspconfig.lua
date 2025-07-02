return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	config = function()
		vim.diagnostic.config({ virtual_lines = true })
	end,
}
