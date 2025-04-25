return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = "1.*",
  opts = {
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    sources = {
      default = { 'lsp', 'path', 'snippets' }
    },
    keymap = {
      ['<A-CR>'] = { 'select_and_accept' },
      [ '<A-k>' ] = { 'select_prev' },
      [ '<A-j>' ] = { 'select_next' },
    },
  }
}
