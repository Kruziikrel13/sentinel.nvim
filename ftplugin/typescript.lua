if Sentinel.has("nvim-treesitter") then
	require("nvim-treesitter").install("typescript")
	vim.treesitter.start(nil, "typescript")
end

if vim.fn.executable("typescript-language-server") then
	vim.lsp.enable("ts_ls")
end
