if Sentinel.has("nvim-treesitter") then
	require("nvim-treesitter").install("cpp"):wait(3000)
	vim.treesitter.start(nil, "cpp")
end

if vim.fn.executable("clangd") then
	vim.lsp.enable("clangd")
end
