return {
  --- Treesitter Core
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
      },
      indent = { enable = true },
      incremental_selection = { enable = true },
    },
    config = function(_, opts)
      local html = require('nvim-treesitter.parsers').get_parser_configs().html
      html.install_info.revision = 'e4d834eb4918df01dcad5c27d1b15d56e3bd94cd' -- force update to latest version to stop crashing

      require('nvim-treesitter.install').compilers = { 'gcc', 'clang' }
      require('nvim-treesitter.configs').setup(opts)
    end
  },
  {
    'windwp/nvim-ts-autotag',
    config = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  }
}
