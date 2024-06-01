return {
  {
    'numToStr/Comment.nvim',
    config = true,
    lazy = false
  },
  {
    'altermo/ultimate-autopair.nvim',
    config = true,
    event = { 'InsertEnter', 'CmdLineEnter' }
  },
  {
    'max397574/better-escape.nvim',
    config = true
  },
  {
    'kylechui/nvim-surround',
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
    dependencies = { 'HiPhish/rainbow-delimiters.nvim' },
    main = 'ibl'
  },
  {
    'rmagatti/auto-session',
    config = true,
    lazy = false
  },
  {
    'gelguy/wilder.nvim',
    opts = {
      modes = {':', '/', '?'}
    },
    config = function (_, opts)
      local wilder = require('wilder')
      wilder.setup(opts)

      wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
          highlighter = wilder.basic_highlighter(),
          max_height = '10%',
          highlights = {
            border = 'Normal'
          },
          border = 'rounded'
        })
      ))
    end
  },
  {
    'mrjones2014/smart-splits.nvim',
    config = true
  },
  {
    'yorickpeterse/nvim-window',
    config = true,
    keys = {
      { '<C-w>s', '<cmd>lua require("nvim-window").pick()<cr>', desc = 'Jump Window'}
    }
  },
  {
    'dstein64/nvim-scrollview',
    config = true
  }
}
