local M = {}

function M.getPlugin(name)
  return require('lazy.core.config').spec.plugins[name]
end

function M.has(name)
  return M.getPlugin(name) ~= nil
end

return M
