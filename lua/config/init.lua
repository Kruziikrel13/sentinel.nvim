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
  require('utils.lib').lazy_notify()

  require('utils.lib').load('options')
  require('utils.lib').load('autocmds')
end

return M
