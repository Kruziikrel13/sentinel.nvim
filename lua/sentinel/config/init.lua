vim.uv = vim.uv or vim.loop

--- @class SentinelConfig
local M = {}
local Util = require('util')
M.name = 'sentinel'
M.version = '30.05.2024'

M.did_init = false
M.init = function()
    if M.did_init then
        return
    end
    M.did_init = true

    -- delay notifications until vim.notify was replaced or after 500ms
    Util.lazy_notify()

    Util.load('options')
    Util.load('keymaps')
end

return M