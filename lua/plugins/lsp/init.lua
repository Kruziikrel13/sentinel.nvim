local module_path = 'plugins.lsp'

local function module(name)
  return require(module_path .. '.' .. name)
end

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  specs = {
    module('ui'),
    module('diagnostics'),
    module('state'),
    module('hover'),
    module('actions'),
  },
  config = function()
    local LspUtil = module('utils')
    LspUtil.startServers()
  end,
  dependencies = module('installer')
}
