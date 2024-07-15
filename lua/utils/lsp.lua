local Plugins = require('utils.plugins')
local Utils = require('utils.lib')
local M = {}

---@class LangServerOpts
---@field name string
---@field opts table

local function get_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  if Plugins.has('cmp-nvim-lsp') then
    capabilities = Utils.merge_tables(
      capabilities, require('cmp_nvim_lsp').default_capabilities()
    )
  end

  return capabilities
end

---@param server string
---@param overrides? table
function M.setupLangServer(server, overrides)
  local opts = {
    capabilities = get_capabilities(),
    on_attach = function(client, bufnr)
      if Plugins.has('workspace-diagnostics.nvim') then
        require('workspace-diagnostics').populate_workspace_diagnostics(client, bufnr)
      end
    end
  }

  if overrides ~= nil then
    opts = Utils.merge_tables(opts, overrides)
  end
  require('lspconfig')[server].setup(opts)
end

---@param ... string | LangServerOpts
function M.setupLangServers(...)
  for _, server in ipairs({...}) do
    if type(server) == 'string' then
      M.setupLangServer(server)
    elseif type(server) == 'table' then
      M.setupLangServer(server.name, server.opts)
    end
  end
end

return M
