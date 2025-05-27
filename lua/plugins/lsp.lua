return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  },
  {
    'j-hui/fidget.nvim',
    event = 'LspAttach',
    opts = {},
    dependencies = { 'neovim/nvim-lspconfig' }
  },
  {
    'Bekaboo/dropbar.nvim',
    event = 'LspAttach',
    opts = {},
    dependencies = { 'nvim-telescope/telescope-fzf-native.nvim', optional = true }
  },
  {
    "Dan7h3x/signup.nvim",
    branch = "main",
    opts = {}
  },
  {
    'nvimdev/lspsaga.nvim',
    opts = {
      breadcrumbs = {
        enable = false
      },
      finder = {
        keys = {
          vsplit = "<C-v>",
          split = "<C-x>",
          toggle_or_open = "<CR>"
        }
      },
      rename = {
        keys = {
          quit = '<Esc>',
          select = 'e'
        }
      },
      lightbulb = {
        sign = false
      }
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
  },
}
