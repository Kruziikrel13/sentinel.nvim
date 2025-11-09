---@diagnostic disable: need-check-nil
local LazyUtil = require("lazy.core.util")

---@class sentinel.util: LazyUtilCore
---@field config SentinelConfig
---@field treesitter sentinel.util.treesitter
---@field events sentinel.util.events
---@field terminal sentinel.util.terminal
---@field ui sentinel.util.ui
local M = {}

function M.is_win()
	return vim.uv.os_uname().sysname:find("Windows") ~= nil
end

---@param name string
function M.get_plugin(name)
	return require("lazy.core.config").spec.plugins[name]
end

function M.has(plugin)
	return M.get_plugin(plugin) ~= nil
end

function M.debounce(ms, fn)
	local timer = vim.uv.new_timer()
	return function(...)
		local argv = { ... }
		timer:start(ms, 0, function()
			timer:stop()
			vim.schedule_wrap(fn)(unpack(argv))
		end)
	end
end

function M.find_file(filename, path)
	return vim.fs.find({ filename }, { path = path, upward = true })[1]
end

---@param exes string | table
---@param notify? boolean
---@overload fun(exes?:table):boolean
---@return boolean
function M.executable(exes, notify)
	if type(exes) == "string" then
		exes = { exes } --@cast exes table
	elseif type(exes) ~= "table" then
		error("Expected string or table, got " .. type(exes))
	end

	local all_ok = true

	for _, exe in ipairs(exes) do
		if vim.fn.executable(exe) ~= 1 then
			if notify then
				vim.notify("Missing executable: " .. exe, vim.log.levels.INFO)
			end
			all_ok = false
		end
	end

	return all_ok
end

-- delay notifications till vim.notify was replaced or after 500ms
function M.lazy_notify()
	local notifs = {}
	local function temp(...)
		table.insert(notifs, vim.F.pack_len(...))
	end

	local orig = vim.notify
	vim.notify = temp

	local timer = vim.uv.new_timer()
	local check = assert(vim.uv.new_check())

	local replay = function()
		timer:stop()
		check:stop()
		if vim.notify == temp then
			vim.notify = orig -- put back the original notify if needed
		end
		vim.schedule(function()
			---@diagnostic disable-next-line: no-unknown
			for _, notif in ipairs(notifs) do
				vim.notify(vim.F.unpack_len(notif))
			end
		end)
	end

	-- wait till vim.notify has been replaced
	check:start(function()
		if vim.notify ~= temp then
			replay()
		end
	end)
	-- or if it took more than 500ms, then something went wrong
	timer:start(500, 0, replay)
end

setmetatable(M, {
	__index = function(t, k)
		if LazyUtil[k] then
			return LazyUtil[k]
		end
		t[k] = require("util." .. k)
		return t[k]
	end,
})

return M
