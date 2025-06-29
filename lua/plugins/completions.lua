return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    signature = { enabled = true },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100
          }
        }
    },
    keymap = {
      ['<A-CR>'] = { 'select_and_accept' },
      ['<A-k>'] = { 'select_prev' },
      ['<A-j>'] = { 'select_next' }
    },
  },
}
