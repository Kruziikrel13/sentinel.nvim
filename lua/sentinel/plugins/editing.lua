local lazyKeyBind = require('utils.keys').lazyKeyBind
local settings = require('configuration')

local freeze = {}
if settings.enable_freeze then
  freeze = {
    'AlejandroSuero/freeze-code.nvim',
    config = true,
    keys = {
      lazyKeyBind('<leader>xf', '<cmd>Freeze<cr>', 'Freeze Code')
    }
  }
end

return { freeze,
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
    'rmagatti/auto-session',
    opts = {
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" }
    },
    config = function (_, opts)
      vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
      require('auto-session').setup(opts)
    end,
    lazy = false,
  },
  {
    'dstein64/nvim-scrollview',
    config = true
  },
  {
    'sitiom/nvim-numbertoggle'
  },
  {
    'LintaoAmons/scratch.nvim',
    opts = {
      window_cmd = 'tabedit'
    },
    keys = {
      lazyKeyBind('<leader>xs', '<cmd>Scratch<cr>', 'Scratch Window')
    }
  },
  {
    'ChuufMaster/buffer-vacuum',
    config = true
  },
  {
    'echasnovski/mini.cursorword',
    config = true
  },
  {
    'nanozuki/tabby.nvim',
    config = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'folke/twilight.nvim',
    config = true
  }
}
