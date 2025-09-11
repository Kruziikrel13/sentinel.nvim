if Sentinel.has("nvim-treesitter") then
	require("nvim-treesitter").install("qmljs")
	vim.treesitter.start(nil, "qmljs")
end

if vim.fn.executable("qmlls") then
	vim.lsp.enable("qmlls")
end
