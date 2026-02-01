---@diagnostic disable: unused-function, unused-local
---@class sentinel.util.fs
local M = {}

function M.stdpath(std, path)
	return vim.fs.normalize(vim.fn.stdpath(std) .. "/" .. path)
end

function M.file_exists(path)
	return vim.loop.fs_stat(path)
end

function M.to_yaml(tbl, indent)
	local function yaml_val(val)
		if type(val) == "boolean" then
			return tostring(val)
		end
		return type(val) == "string" and not val:find("^\"'`") and ("%q"):format(val) or val
	end

	indent = indent or 0
	local lines = {}
	for k, v in pairs(tbl) do
		table.insert(lines, string.rep(" ", indent) .. k .. (type(v) == "table" and ":" or ": " .. yaml_val(v)))
		if type(v) == "table" then
			if (vim.islist)(v) then
				for _, item in ipairs(v) do
					table.insert(lines, string.rep(" ", indent + 2) .. "- " .. yaml_val(item))
				end
			else
				vim.list_extend(lines, M.to_yaml(v, indent + 2))
			end
		end
	end
	return lines
end

return M
