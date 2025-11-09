---@class sentinel.util.events
local M = {}

function M.setup()
	M.lazy_file()
end

function M.create_event(name, events)
	local Event = require("lazy.core.handler.event")

	Event.mappings[name] = { id = name, event = events }
	Event.mappings["User " .. name] = Event.mappings[name]
end

M.lazy_file_events = { "BufReadPost", "BufNewFile", "BufWritePre" }
function M.lazy_file()
	M.create_event("LazyFile", M.lazy_file_events)
end

return M
