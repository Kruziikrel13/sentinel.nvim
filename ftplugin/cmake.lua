if Sentinel.has("nvim-treesitter") then
	require("nvim-treesitter").install("cmake"):wait(3000)
	vim.treesitter.start(nil, "cmake")
end

if vim.fn.executable("neocmakelsp") then
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	vim.lsp.config("neocmake", {
		capabilities = capabilities,
	})
	vim.lsp.enable("neocmake")
end
