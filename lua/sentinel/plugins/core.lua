require('sentinel.config').init()
return {
  'folke/lazy.nvim',
  {
    'roobert/activate.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } }
  }
}
