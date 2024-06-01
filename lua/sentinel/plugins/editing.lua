local util = require "util"
return {
  {
    'numToStr/Comment.nvim',
    config = true,
    lazy = false
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
      if util.has('nvim-cmp') then
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end
    end,
    event = 'InsertEnter'
  },
  {
    'max397574/better-escape.nvim',
    config = true
  }
}
