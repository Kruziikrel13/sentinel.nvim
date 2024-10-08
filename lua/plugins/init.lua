if vim.fn.has('nvim-0.10.0') == 0 then
  vim.api.nvim_echo({
    { 'Configuration requires Neovim >= 0.10.0\n', 'ErrorMsg' },
    { 'Press any key to exit', 'MoreMsg' }
  }, true, {})
  vim.fn.getchar()
  os.exit(1)
  return {}
end

require('helpers.utils').lazy_notify()

return { 'folke/lazy.nvim', version = "*" }
