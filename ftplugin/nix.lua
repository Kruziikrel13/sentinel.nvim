vim.treesitter.start()

if vim.fn.executable("nixd") then
	vim.lsp.enable("nixd")
end

if vim.fn.executable("statix") then
	vim.lsp.enable("statix")
end
