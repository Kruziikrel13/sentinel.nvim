--[[
  File: localconf.lua
  Description: Library for easily accessing neovim functions from local configuration files such as .lazy.lua
]]
local M = {}

function M.lsp_servers(...)
  require('plugins.lsp.instance').addServers(...)
end

function M.terminal_command(keybind, cmd, desc)
  if require('helpers.plugins').has('toggleterm.nvim') then
    vim.keymap.set('n', keybind, function ()
      require('toggleterm').exec(cmd)
    end, { silent = true, desc = desc })
  else
    vim.keymap.set('n', keybind, function ()
      vim.cmd.vsplit()
      vim.cmd.terminal()
      vim.api.nvim_chan_send(vim.bo.channel, cmd)
      vim.api.nvim_feedkeys("a", "t", false)
    end, { silent = true, desc = desc })
  end
end

return M
