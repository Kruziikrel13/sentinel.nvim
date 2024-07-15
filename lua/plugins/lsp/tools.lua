return {
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'LspAttach',
    config = function()
      vim.diagnostic.config({ virtual_text = false })
      require('tiny-inline-diagnostic').setup()
    end
  },
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
    'Bekaboo/dropbar.nvim',
    event = 'LspAttach',
    opts = {},
    dependencies = { 'nvim-telescope/telescope-fzf-native.nvim', optional = true }
  },
  {
    'kruziikrel13/lspsaga',
    event = 'LspAttach',
    dir = '~/definitions',
    opts = {},
    dev = true,
    keys = {
      { '<Tab>r', '<cmd>Lspsaga rename ++project<cr>',
        desc = 'Rename Symbol'},
      { '<Tab>d', '<cmd>Lspsaga peek_definition<cr>',
        desc = 'Peek Definition' },
      { '<Tab>o', '<cmd>Lspsaga outline<cr>',
        desc = 'File Code Outline' },
      { '<Tab>f', '<cmd>Lspsaga finder<cr>',
        desc = 'Project Symbol Finder' },

    }
  },
  {
    'aznhe21/actions-preview.nvim',
    keys = {
      { '<Tab>a', function ()
        require('actions-preview').code_actions()
      end, desc = 'Actions Preview' }
    }
  }
}
