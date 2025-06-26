return {
  {
    'folke/snacks.nvim',
    opts = {
      lazygit = { enable = true }
    },
    keys = {
      { '<leader>gg', function()
        Snacks.lazygit()
      end, desc = 'LazyGit' }
    }
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'BufEnter' },
    opts = { current_line_blame = true }
  }
}
