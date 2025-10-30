---@class sentinel.util.treesitter
local M = {}

M._installed = nil ---@type table<string,boolean>?
M._queries = {} ---@type table<string,boolean>

---@param update boolean?
function M.get_installed(update)
	if update then
		M._installed, M._queries = {}, {}

		for _, lang in ipairs(require("nvim-treesitter").get_installed("parsers")) do
			M._installed[lang] = true
		end
	end

	return M._installed or {}
end

---@param what string|number|nil
---@param query? string
---@overload fun(buf?:number):boolean
---@overload fun(ft:string):boolean
---@return boolean
function M.have(what, query)
	what = what or vim.api.nvim_get_current_buf()
	what = type(what) == "number" and vim.bo[what].filetype or what --[[@as string]]
	local lang = vim.treesitter.language.get_lang(what)
	if lang == nil or M.get_installed()[lang] == nil then
		return false
	end
	if query and not M.have_query(lang, query) then
		return false
	end
	return true
end

---@param lang string
---@param query string
function M.have_query(lang, query)
	local key = lang .. ":" .. query
	if M._queries[key] == nil then
		M._queries[key] = vim.treesitter.query.get(lang, query) ~= nil
	end
	return M._queries[key]
end

function M.foldexpr()
	return M.have(nil, "folds") and vim.treesitter.foldexpr() or "0"
end

function M.indentexpr()
	return M.have(nil, "indents") and require("nvim-treesitter").indentexpr() or -1
end

---@param cb fun()
function M.build(cb)
	local is_win = vim.fn.has("win32") == 1

	local function have(tool, win)
		return (win == nil or is_win == win) and vim.fn.executable(tool) == 1
	end

	local have_compiler = vim.env.CC ~= nil or have("cc", false) or have("cl", true)

	if not have_compiler and have("gcc") then
		vim.env.CC = "gcc"
		have_compiler = true
	end

	if not (have_compiler and have("treesitter") and have("curl") and have("tar")) then
		vim.notify("Missing treesitter dependency, run :checkhealth nvim-treesitter for more info")
		return
	end

	return cb()
end

return M
