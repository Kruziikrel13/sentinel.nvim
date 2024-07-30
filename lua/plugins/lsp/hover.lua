return {
  {
    'LukasPietzschmann/boo.nvim',
    opts = {
      max_width = 100,
      max_height = 80,
      focus_on_open = false
    },
    keys = {
      { '<Tab><Tab>', function ()
        require('boo').boo()
      end, desc = 'Hover Info' }
    }
  },
  {
    'kruziikrel13/lspsaga',
    opts = {},
    keys = {
      { '<Tab>r', '<cmd>Lspsaga rename ++project<cr>',
        desc = 'Rename' },
      { '<Tab>d', '<cmd>Lspsaga peek_definition<cr>',
        desc = 'Peek' },
      { '<Tab>f', '<cmd>Lspsaga finder<cr>',
        desc = 'Find' }
    }
  }
}
