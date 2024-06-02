vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  pattern = '*',
  callback = function()
    vim.cmd.checktime()
  end
})
