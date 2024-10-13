--[[
  File: localconf.lua
  Description: Library for easily accessing neovim functions from local configuration files such as .lazy.lua
]]
local M = {}

function M.addLspServers(...)
  require('plugins.lsp.instance').addServers(...)
end

return M
