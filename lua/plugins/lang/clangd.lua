if not Sentinel.executable("clangd") then
	return {}
end

return {
	{ "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = "cpp" } },
}
