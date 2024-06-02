--- @class SentinelConfig
local M = {}
M.name = 'sentinel'
M.version = '02.06.2024'

M.setup = function()
  vim.uv = vim.uv or vim.loop
  vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup('Sentinel', { clear = true }),
    pattern = 'VeryLazy',
    callback = function()
      -- we load keymaps after everything else is done
      require('util').load('keymaps')
    end
  })
end

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
end

return M
