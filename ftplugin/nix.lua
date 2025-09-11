if Sentinel.has("nvim-treesitter") then
	require("nvim-treesitter").install("nix")
	vim.treesitter.start(nil, "nix")
end

if vim.fn.executable("nixd") then
	vim.lsp.enable("nixd")
end

if vim.fn.executable("statix") then
	vim.lsp.enable("statix")
end
