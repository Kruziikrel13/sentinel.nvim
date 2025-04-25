return {
  {
    'folke/trouble.nvim',
    opts = {},
    keys = {
      { '<leader>ld', function ()
        require('trouble').open({
          mode = 'diagnostics',
          focus = true
        })
      end, desc = 'Workspace Diagnostics' },
    }
  },
  {
    'hedyhli/outline.nvim',
    opts = {},
    keys = {
      { '<leader>lo', function()
        require('outline').toggle()
      end, desc = 'Document Outline'}
    }
  }
}
