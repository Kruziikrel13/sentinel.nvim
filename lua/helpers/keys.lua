local M = {}

---@enum MODE
M.MODE = {
  NORMAL = 'n',
  VISUAL = 'x',
  INSERT = 'i',
  TERMINAL = 't',
  COMMAND = 'c',
  OPERATOR_PENDING = 'o',
  SELECT = 's'
}

---@param mode MODE
---@param lhs string
---@param rhs string | function
---@param
function M.map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

return M
