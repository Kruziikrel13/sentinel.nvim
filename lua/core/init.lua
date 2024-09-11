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
  require('helpers.utils').lazy_notify()

  require('helpers.utils').load('core.options')
  require('helpers.utils').load('core.autocmds')
end

return M
