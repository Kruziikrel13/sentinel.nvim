--[[
  File: config/init.lua
  Description: Neovim Configuration Init File.
  Depends on lazy.core and as such has to be called after lazy has been bootstrapped and is available.
]]

_G.Sentinel = require('util')

---@class SentinelConfig: SentinelOptions
local M = {}
Sentinel.config = M

---@class SentinelOptions
local defaults = {
  ---@type string|fun()
  colorscheme = 'github_dark_default'
}

---@type SentinelOptions
local options
local lazy_clipboard

function M.setup(opts)
  options = vim.tbl_deep_extend('force', defaults, opts or {}) or {}

  -- autocmds can be loaded lazily when not opening a file
  local lazy_autocmds = vim.fn.argc(-1) == 0
  if not lazy_autocmds then
    M.load('autocmds')
  end
  Sentinel.colorscheme.setup(opts.colorscheme)

  local group = vim.api.nvim_create_augroup('Sentinel', { clear = true })
  vim.api.nvim_create_autocmd('User', {
    group = group,
    pattern = 'VeryLazy',
    callback = function()
      if lazy_autocmds then
        M.load('autocmds')
      end
      M.load('keymaps')
      if lazy_clipboard ~= nil then
        vim.opt.clipboard = lazy_clipboard
      end

      Sentinel.format.setup()
      Sentinel.colorscheme.enable()

      vim.api.nvim_create_user_command('SentinelHealth', function()
        vim.cmd([[Lazy! load all]])
        vim.cmd([[checkhealth]])
      end, { desc = 'Load all plugins and run :checkhealth' })

      local health = require('lazy.health')
      vim.list_extend(health.valid, {
        'recommended',
        'desc'
      })
    end
  })
end

---@param name "autocmds" | "options" | "keymaps"
function M.load(name)
  local function _load(mod)
    if require('lazy.core.cache').find(mod)[1] then
      Sentinel.try(function()
        require(mod)
      end, { msg = 'Failed loading ' .. mod })
    end
  end
  _load('config.' .. name)
  if vim.bo.filetype == 'lazy' then
    vim.cmd([[do VimResized]])
  end
end

M.did_init = false
function M.init()
  if M.did_init then
    return
  end
  M.did_init = true

  Sentinel.lazy_notify()

  M.load('options')
  lazy_clipboard = vim.opt.clipboard
  vim.opt.clipboard = ""
end

-- Implement M.load
-- Implement M.init

-- Will load value set from SentinelOpts if it has been set,
-- Otherwise it will just use the default value set in defaults.
setmetatable(M, {
  __index = function(_, key)
    if options == nil then
      return vim.deepcopy(defaults)[key]
    end
    ---@cast options SentinelConfig
    return options[key]
  end
})

return M
