if Sentinel.has("nvim-treesitter") then
	require("nvim-treesitter").install("lua")
	vim.treesitter.start(nil, "lua")
end
