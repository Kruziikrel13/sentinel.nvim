vim.treesitter.start()

if vim.fn.executable("qmlls") then
	vim.lsp.enable("qmlls")
end
