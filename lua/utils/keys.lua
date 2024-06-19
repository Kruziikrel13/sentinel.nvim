--- @class Keys
local M = {}

--- @param mode mode
--- @param key string
--- @param cmd string | function
--- @param opts table?
-- Vim Keymap wrapper, we specify our own default opts if none are passed during call
M.safe_map = function(mode, key, cmd, opts)
    local keys = require('lazy.core.handler').handlers.keys

    -- do not create keymap if lazy keys handler exists
    if keys ~= nil then
      if not keys.active[keys.parse({key, mode = mode}).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, key, cmd, opts)
      end
    end
end

return M
