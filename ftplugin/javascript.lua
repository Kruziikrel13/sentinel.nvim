if Sentinel.has("nvim-treesitter") then
	require("nvim-treesitter").install("javascript")
	vim.treesitter.start(nil, "javascript")
end

if vim.fn.executable("typescript-language-server") then
	vim.lsp.enable("ts_ls")
end
