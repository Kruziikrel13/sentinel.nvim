local Util = require('util')

local function setup_language_servers()
  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  lspconfig.lua_ls.setup {
    capabilities = capabilities
  }
end

Util.on_plugin_load('nvim-lspconfig', setup_language_servers)

return {}
