--- @class Keys
local M = {}

local default_opts = { noremap = true, silent = true }

---@enum MODE
M.MODE = {
  NORMAL = 'n',
  VISUAL = 'x',
  INSERT = 'i',
  TERMINAL = 't',
  COMMAND = 'c',
  OPERATOR_PENDING = 'o',
  SELECT = 's'
}

--- @param mode string
--- @param key string
--- @param cmd string | function
--- @param opts table?
-- Vim Keymap wrapper, we specify our own default opts if none are passed during call
function M.safe_map(mode, key, cmd, opts)
    local keys = require('lazy.core.handler').handlers.keys

    -- do not create keymap if lazy keys handler exists
    if keys ~= nil then
    ---@diagnostic disable-next-line: undefined-field
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
function M.lazyKeyBind(key, cmd, description)
    return { key, cmd, desc = description }
end

--- @param description string
--- @return table
-- Wrapper for defining a which key description group
function M.whichKeyGroup(description)
    return { name = description }
end

---@param mode MODE
function M.map(mode, key, cmd, opts)
  opts = opts or default_opts

  vim.keymap.set(mode, key, cmd, opts)
end


return M
