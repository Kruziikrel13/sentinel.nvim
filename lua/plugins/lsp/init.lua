local function module(name)
  return require('plugins.lsp.' .. name)
end

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  specs = {
    module('ui'),
    module('diagnostics'),
    module('state'),
    module('hover'),
    module('actions')
  },
  dependencies = module('installer')
}
