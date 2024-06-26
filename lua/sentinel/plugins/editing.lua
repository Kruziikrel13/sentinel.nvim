local lazyKeyBind = require('utils.keys').lazyKeyBind

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
    'fnune/recall.nvim',
    config = function()
      vim.opt.secure = true
    end,
    keys = {
      lazyKeyBind('<leader>mm', '<cmd>lua require("recall").toggle()<cr>', 'Recall: Toggle'),
      lazyKeyBind('<leader>mn', '<cmd>lua require("recall").goto_next()<cr>', 'Recall: Goto Next'),
      lazyKeyBind('<leader>mp', '<cmd>lua require("recall").goto_prev()<cr>', 'Recall: Goto Previous'),
      lazyKeyBind('<leader>ml', '<cmd>lua require("recall").clear()<cr>', 'Recall: Clear Marks'),
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
    },
    config = true
  },
  {
    'kylechui/nvim-surround',
    config = true,
    event = 'VeryLazy'
  },
  {
    'roobert/surround-ui.nvim',
    main = "surround-ui",
    dependencies = {
      'kylechui/nvim-surround',
      'folke/which-key.nvim'
    },
    opts = {
      root_key = "S"
    },
    config = true
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function(_, opts)
      require('ibl').setup(opts)
    end,
    opts = {
      exclude = { filetypes = { 'nvimtree', 'dashboard' } },
      scope = { enabled = true }
    },
    main = 'ibl'
  },
  {
    'dstein64/nvim-scrollview',
    config = true
  },
  {
    'sitiom/nvim-numbertoggle'
  },
  {
    'ChuufMaster/buffer-vacuum',
    config = true
  },
  {
    'chentoast/marks.nvim',
    config = true
  },
  {
    'numToStr/Comment.nvim',
    config = true,
    lazy = false
  },
  {
    'altermo/ultimate-autopair.nvim',
    config = true,
    event = 'InsertEnter'
  },
  {
    'mrcjkb/nvim-lastplace'
  },
  {
    'max397574/better-escape.nvim',
    config = true
  }
}
