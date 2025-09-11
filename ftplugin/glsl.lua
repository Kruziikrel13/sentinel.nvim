if Sentinel.has("nvim-treesitter") then
	require("nvim-treesitter").install("glsl")
	vim.treesitter.start(nil, "glsl")
end

if vim.fn.executable("glsl_analyzer") then
	vim.lsp.enable("glsl_analyzer")
end
