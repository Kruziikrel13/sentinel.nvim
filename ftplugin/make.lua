if Sentinel.has("nvim-treesitter") then
	require("nvim-treesitter").install("make"):wait(3000)
	vim.treesitter.start(nil, "make")
end
