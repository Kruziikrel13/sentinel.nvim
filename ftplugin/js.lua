if Sentinel.has("nvim-treesitter") then
	require("nvim-treesitter").install("javascript")
	vim.treesitter.start(nil, "javascript")
end
