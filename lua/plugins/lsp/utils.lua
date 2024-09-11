local Plugins = require('helpers.plugins')
local Utils = require('helpers.utils')

local M = {}

--- Servers appended to this list via appendServers will be configured and started by lspconfig when it loads
M.servers = {}

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

function M.appendServers(...)
  for _, servername in ipairs({...}) do
    table.insert(M.servers, servername)
  end
end

function M.startServers()
  if Utils.is_not_empty(M.servers) then
    M.setupLangServers(unpack(M.servers))
  end
end

return M
