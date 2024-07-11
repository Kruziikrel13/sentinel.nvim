--- @class Keys
local M = {}

local default_opts = { noremap = true, silent = true }

--- @param mode string
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

--- @param key string
--- @param cmd string | function
--- @param description string
--- @return table
-- Wrapper for defining a key and returning it in a LazyVim readable format
M.lazyKeyBind = function(key, cmd, description)
    return { key, cmd, desc = description }
end

--- @param description string
--- @return table
-- Wrapper for defining a which key description group
M.whichKeyGroup = function(description)
    return { name = description }
end

function M.map(mode, key, cmd, opts)
  opts = opts or default_opts

  vim.keymap.set(mode, key, cmd, opts)
end


return M
