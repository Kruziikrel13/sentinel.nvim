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
    'folke/trouble.nvim',
    opts = {},
    keys = {
      { '<Tab><leader>', function ()
        require('trouble').open({
          mode = 'diagnostics',
          focus = true
        })
      end, desc = 'Workspace Diagnostics' },
      { '<Tab>o', function ()
        require('trouble').toggle({
          mode = 'symbols',
          focus = true,
          win = {
            type = 'float'
          }
        })
      end, desc = 'Document Outline' },
    }
  },
  {
    'kruziikrel13/lspsaga',
    opts = {},
    keys = {
      { '<Tab>r', '<cmd>Lspsaga rename ++project<cr>',
        desc = 'Rename Symbol'},
      { '<Tab>d', '<cmd>Lspsaga peek_definition<cr>',
        desc = 'Peek Definition' },
      { '<Tab>f', '<cmd>Lspsaga finder<cr>',
        desc = 'Project Symbol Finder' }
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
