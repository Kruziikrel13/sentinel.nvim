---@class sentinel.util.debugging
local M = {}

local tracked_variables = {}

---@param key string|number
---@param var? string|number|table
function M.update(key, var)
	local exists = tracked_variables[key] ~= nil

	if exists then
		if var == nil and type(tracked_variables[key]) == "table" and tracked_variables[key]["update"] ~= nil then
			local updated_val = tracked_variables[key]["update"]()
			tracked_variables[key] = vim.tbl_deep_extend("force", tracked_variables[key], updated_val)
		elseif var ~= nil and type(var) == "table" then
			tracked_variables[key] = vim.tbl_deep_extend("force", tracked_variables[key], var)
		elseif var ~= nil then
			tracked_variables[key] = var
		else
			Sentinel.error(("Unable to update key {%s}"):format(key))
		end
		Snacks.debug("Update", key, tracked_variables[key])
	elseif var ~= nil then
		tracked_variables[key] = var
		Snacks.debug("Create", key, tracked_variables[key])
	else
		Sentinel.error("Invalid call to update parameter")
	end
end

function M.get(key)
	if tracked_variables[key] ~= nil then
		Snacks.debug.inspect("Get", key, tracked_variables[key])
		return tracked_variables[key]
	else
		Snacks.debug.inspect("Get", key, tracked_variables[key])
		return nil
	end
end

---@param key? string|number
function M.clear(key)
	if key ~= nil then
		tracked_variables[key] = nil
		Snacks.debug(("Cleared variable {%s}"):format(key))
	else
		tracked_variables = {}
		Snacks.debug("Cleared all tracked variables")
	end
end

return M
