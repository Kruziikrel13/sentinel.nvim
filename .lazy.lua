local LangServerUtil = require('utils.lsp')

return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      }
    },
    config = function(_, opts)
      require("lazydev").setup(opts)
      LangServerUtil.setupLangServer('lua_ls')
    end,
  },
  {
    "Bilal2453/luvit-meta", lazy = true
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  }
}
