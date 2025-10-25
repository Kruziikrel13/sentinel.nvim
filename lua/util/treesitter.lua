---@class sentinel.util.treesitter
local M = {}

local filetype_map = {
	c = { parser = "c", lsp = "clangd" },
	cpp = { parser = "cpp", lsp = { "clangd", "clang-tidy" } },
	cmake = { parser = "cmake", lsp = { "neocmake", exe = "neocmakelsp" } },
	glsl = { parser = "glsl", lsp = "glsl_analyzer" },
	shaderslang = { parser = "slang", lsp = "slangd" },
	javascript = { parser = "javascript", lsp = { "ts_ls", exe = "typescript-language-server" } },
	lua = { parser = "lua" },
	make = { parser = "make" },
	markdown = function()
		vim.b.minipairs_disable = true
	end,
	nix = { parser = "nix", lsp = { "nixd", "statix" } },
	qml = { parser = "qmljs", lsp = "qmlls" },
	typescript = { parser = "typescript", lsp = { "ts_ls", exe = "typescript-language-server" } },
}

function M.setup()
	local supported_filetypes = {}

	for k in pairs(filetype_map) do
		table.insert(supported_filetypes, k)
	end

	vim.api.nvim_create_autocmd("FileType", {
		pattern = supported_filetypes,
		callback = function()
			local handle = filetype_map[vim.bo.filetype]

			if type(handle) == "function" then
				handle()
				return
			end

			if Sentinel.has("nvim-treesitter") and handle.parser then
				require("nvim-treesitter").install(handle.parser)
				vim.treesitter.start(nil, handle.parser)
			end

			if handle.lsp == nil then
				return
			end

			local lsp = handle.lsp
			if type(lsp) == "table" then
				for k, v in pairs(lsp) do
					if k ~= "exe" then
						local exe = lsp.exe or v
						if vim.fn.executable(exe) == 1 then
							vim.lsp.enable(v)
						end
					end
				end
			else
				if type(lsp) == "string" then
					if vim.fn.executable(lsp) == 1 then
						vim.lsp.enable(lsp)
					end
				end
			end
		end,
	})
end

return M
