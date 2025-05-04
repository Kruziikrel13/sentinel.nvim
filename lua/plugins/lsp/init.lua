local module_path = 'plugins.lsp'

local function module(name)
  return require(module_path .. '.' .. name)
end

local Instance = module('instance')

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  cond = function()
    return Instance.hasServers()
  end,
  specs = {
    module('ui'),
    module('hover'),
    module('actions'),
  },
  config = function()
    Instance.startServers()
  end,
}
