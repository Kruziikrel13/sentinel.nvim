if vim.fn.has('nvim-0.10.0') == 0 then
  vim.api.nvim_echo({
    { 'Configuration requires Neovim >= 0.10.0\n', 'ErrorMsg' },
    { 'Press any key to exit', 'MoreMsg' }
  }, true, {})
  vim.fn.getchar()
  vim.cmd([[quit]])
  return {}
end

require('core').init()

return { 'folke/lazy.nvim', version = "*" }
