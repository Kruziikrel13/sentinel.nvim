---@class Lib
local M = {}
local settings = require('configuration')
local LazyUtil = require('lazy.core.util')

---@return boolean # true if the passed variable is not empty
function M.is_not_empty(var)
  return var ~= nil or var ~= '' or next(var)
end

---@return boolean # true if the passed variable is empty
function M.is_empty(var)
  return var == nil or var == '' or not next(var)
end

---@param table table
---@param key string
---@return boolean # true if table contains key
function M.table_contains(table, key)
  for entry, _ in pairs(table) do
    if entry == key then return true end
  end
  return false
end

---@param ... table tables to merge
---@return table # tables merged into single table
function M.merge_tables(...)
  return vim.tbl_deep_extend('force', {}, ...)
end

---@param name string
---@param namespace_override? string
---Loads module with namespace prefixed
function M.load(name, namespace_override)
  local nspace = namespace_override or settings.namespace
  local mod = nspace .. '.' .. name
  LazyUtil.try(function()
    require(mod)
  end, {
      msg = 'Failed loading ' .. mod,
      on_error = function(msg)
        local modpath = require('lazy.core.cache').find('mod')
        if modpath then
          LazyUtil.error(msg)
        end
      end
    })
end

---@param fn function
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function()
      fn()
    end
  })
end

---Delays notifications until configuration has loaded
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
      vim.notify = orig -- put back original notify if needed
    end
    vim.schedule(function()
      --- @diagnostic disable-next-line: no-unknown
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

return M
