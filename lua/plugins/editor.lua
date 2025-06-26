return {
  {
    'echasnovski/mini.pairs',
    version = false,
    event = 'VeryLazy',
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { "string" },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    }
  },
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    'echasnovski/mini.ai',
    version = false,
    event = 'VeryLazy',
    opts = {},
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    cmd = 'LazyDev',
    opts = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "snacks.nvim", words = { "Snacks" } },
      { path = "lazy.nvim", words = { "LazyVim" } },
    }
  }
}
