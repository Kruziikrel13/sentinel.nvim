local Plugins = require('helpers.plugins')
local M = {}

local SentinelUtils = require('helpers.utils')

M.servers = {}
function M.addServers(...) 
  for _, server in ipairs({...}) do
    table.insert(M.servers, server)
  end
end

function M.hasServers()
  return not vim.tbl_isempty(M.servers)
end

local function setupServer(server, overrides)
  local options = {
    capabilities = M.capabilities
  }

  if Plugins.has('blink.cmp') then
    options.capabilities = require('blink.cmp').get_lsp_capabilities(options.capabilities)
  end

  if overrides ~= nil and type(overrides) == 'table' then
    options = SentinelUtils.merge_tables(options, overrides)
  end
  require('lspconfig')[server].setup(options)
end

function M.startServers()
  if not M.hasServers() then
    return nil
  end

  M.capabilities = vim.lsp.protocol.make_client_capabilities()
  if SentinelUtils.is_not_empty(M.capabilityHooks) then
    for _, capabilityHook in ipairs(M.capabilityHooks) do
      SentinelUtils.merge_tables(M.capabilities, capabilityHook())
    end
  end

  if SentinelUtils.is_not_empty(M.preSetupHooks) then
    for _, preSetupHook in ipairs(M.preSetupHooks) do
      preSetupHook()
    end
  end

  for _, server in ipairs(M.servers) do
    if type(server) == 'string' then
      setupServer(server)
    elseif type(server) == 'table' then
      setupServer(server.name, server.opts)
    end
  end
end

M.capabilities = nil
M.capabilityHooks = {} -- executed during capability setup
function M.addCapabilityHooks(...)
  for _, capabilityHook in ipairs({...}) do
    if type(capabilityHook) == 'function' then
      table.insert(M.capabilityHooks, capabilityHook)
    else
      vim.notify("LSP: Cannot add Capability Hook as it is not a function", vim.log.levels.ERROR)
    end
  end
end

M.preSetupHooks = {} -- executed prior to lsp setup being called
function M.addPreSetupHooks(...)
  for _, preSetupHook in ipairs({...}) do
    if type(preSetupHook) == 'function' then
      table.insert(M.preSetupHooks, preSetupHook)
    else
      vim.notify("LSP: Cannot add Pre Setup Hook as it is not a function", vim.log.levels.ERROR)
    end
  end
end

return M
