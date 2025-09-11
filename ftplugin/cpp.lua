vim.treesitter.start()

if vim.fn.executable("clangd") then
	vim.lsp.enable("clangd")
end
