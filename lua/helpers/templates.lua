local M = {}

M.templates = {
  web = [[
require('plugins.lsp.utils').appendServers('ts_ls', 'html')
return {}]],
  gcc = [[
require('plugins.lsp.utils').appendServers('clangd')
return {}]],
  lua = [[
require('plugins.lsp.utils').appendServers('lua_ls')
return {}]]
}

function M.writeTemplate()
  local Utils = require('helpers.utils')
  local keylist = Utils.table_keys(M.templates)
  Utils.select(keylist, 'Select Template', function(selection)
    if selection == nil then
      return
    end
    local absolute_path = Utils.find_root() .. '/.lazy.lua'
    if vim.fn.filereadable(absolute_path) == 1 then
      Utils.select({ 'yes', 'no' }, 'Overwrite Existing?', function(confirmation)
        if confirmation == 'yes' then
          Utils.file_write(absolute_path, M.templates[selection])
        end
      end)
    else
      Utils.file_write(absolute_path, M.templates[selection])
    end
  end )
end

return M
