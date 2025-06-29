return {
  'kruziikrel13/snacks.nvim',
  opts = {
    explorer = { enable = true  }
  },
  keys = {
    { 't', function()
      Snacks.explorer()
    end, { desc = 'File Explorer' } }
  }
}
