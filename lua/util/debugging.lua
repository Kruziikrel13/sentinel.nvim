---@class Sentinel.Util.Debugging
local M = {}

M.debugging = false

M.adapters = {
  gdb = {
    type = 'executable',
    command = 'gdb',
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
  }
}

M.configurations = {
  c = {
    {
      name = 'Launch',
      type = 'gdb',
      request = 'launch',
      program = "${command:pickFile}",
      cwd = '${workspaceFolder}'
    }
  }
}

function M.enableDebugging()
  M.debugging = true
end

return M
