require('sentinel.config').init()
local lazyKeyBind = require('utils.keys').lazyKeyBind
return {
  'folke/lazy.nvim',
  {
    'roobert/activate.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } }
  }
}
