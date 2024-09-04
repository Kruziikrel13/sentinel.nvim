return {
  {
    'nvimdev/lspsaga.nvim',
    opts = {
      finder = {
        keys = {
          vsplit = "<C-c>v",
          split = "<C-c>x",
          toggle_or_open = "<CR>"
        }
      },
      rename = {
        keys = {
          quit = '<Esc>',
          select = 'e'
        }
      },
    },
    keys = {
      { '<Tab><Tab>', '<cmd>Lspsaga hover_doc<cr>',
        desc = 'Hover Doc' },
      { '<Tab>r', '<cmd>Lspsaga rename ++project<cr>',
        desc = 'Rename' },
      { '<Tab>d', '<cmd>Lspsaga peek_definition<cr>',
        desc = 'Peek' },
      { '<Tab>f', '<cmd>Lspsaga finder<cr>',
        desc = 'Find' }
    }
  }
}
