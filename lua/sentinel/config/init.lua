--- @class SentinelConfig
local M = {}
M.name = 'sentinel'
M.version = '02.06.2024'

M.did_init = false
M.init = function()
  if M.did_init then
    return
  end
  M.did_init = true

  -- delay notifications until vim.notify was replaced or after 500ms
  require('util').lazy_notify()

  require('util').load('options')
  require('util').load('autocmds')
  require('util').load('keymaps')
end

return M
