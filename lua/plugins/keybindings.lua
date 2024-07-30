local Keys = require('utils.keys')

Keys.map(Keys.MODE.NORMAL, '00', '^', { silent = true, noremap = true }) -- Only way to overwrite the original mapping
Keys.map(Keys.MODE.NORMAL, '0', '0', { silent = true, noremap = true }) -- Only way to overwrite the original mapping

return {
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    opts = {
      spec = {
        { '<leader>x', group = 'Utilities' },
        { '<leader>f', group = 'Find' },
        { '<leader>g', group = 'Git' },
        { '<leader>l', group = 'Language Server' },
        { '<Tab>', group = 'Hover Utilities' },
        { '<leader>xl', '<cmd>Lazy<cr>', desc = 'Lazy' },
        { 'M', '<cmd>delm!<cr>', desc = 'Clear Marks' }
      }
    },
    keys = {
      { '<leader>?', function ()
        require('which-key').show({global = false})
      end, desc = 'Buffer Local Keymaps' },
      { '?', function ()
        require('which-key').show()
        end, desc = 'Keymaps' }
    }
  }
}
