if Sentinel.has("nvim-treesitter") then
	require("nvim-treesitter").install("c")
	vim.treesitter.start(nil, "c")
end

if vim.fn.executable("clangd") then
	vim.lsp.enable("clangd")
end
