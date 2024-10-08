return {
  {
    'jedrzejboczar/possession.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    opts = {
      autosave = {
        current = true,
        cwd = true
      },
      autoload = 'last_cwd'
    }
  },
  {
    'folke/flash.nvim',
    opts = {
      modes = {
        char = {
          jump_labels = true,
          keys = { ["t"] = '.', ["T"] = ',' },
        }
      }
    }
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      exclude = { filetypes = { 'nvimtree', 'dashboard' } },
      scope = { enabled = true }
    },
    main = 'ibl'
  },
  {
    'altermo/ultimate-autopair.nvim',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'ChuufMaster/buffer-vacuum',
    opts = {}
  },
  {
    'dstein64/nvim-scrollview',
    opts = {}
  },
  -- {
  --   'max397574/better-escape.nvim',
  --   opts = {}
  -- },
  {
    'mrcjkb/nvim-lastplace'
  },
  {
    'sitiom/nvim-numbertoggle'
  },
  {
    'stevearc/quicker.nvim',
    opts = {},
    event = "Filetype qf"
  }
}
