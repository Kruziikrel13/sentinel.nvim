local lazyKeyBind = require('utils.keys').lazyKeyBind


local function open_hook(bufnr)
  local function close_callback()
    require('goto-preview').close_all_win()
    vim.api.nvim_buf_del_keymap(bufnr, 'n', 'q')
  end

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', '', {
    nowait = true,
    noremap = true,
    callback = close_callback
  })
end

return {
  'rmagatti/goto-preview',
  opts = {
    resizing_mappings = true,
    post_open_hook = open_hook
  },
  keys = {
    lazyKeyBind('<Tab>p', '<cmd>lua require("goto-preview").goto_preview_definition()<cr>', 'Goto Preview')
  }
}
