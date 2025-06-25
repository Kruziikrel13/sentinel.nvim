local M = {}

---@class SentinelFormatter
---@field active boolean
---@field name string
---@field format fun(bufnr:number)

local formatter
function M.register(fmt)
  formatter = fmt
end

function M.formatexpr()
  if Sentinel.has('conform.nvim') then
    return require('conform').formatexpr()
  end
  return vim.lsp.formatexpr({ timeout_ms = 3000 })
end

---@param buf? number
function M.enabled(buf)
  buf = (buf == nil or buf == 0) and vim.api.nvim_get_current_buf() or buf
  local gaf = vim.g.autoformat
  local baf = vim.b[buf].autoformat

  -- If the buffer has a local value, use that
  if baf ~= nil then
    return baf
  end

  -- Otherwise use the global value if set, or true by default
  return gaf == nil or gaf
end

---@param buf? boolean
function M.toggle(buf)
  M.enable(not M.enabled(), buf)
end

---@param enable? boolean
---@param buf? boolean
function M.enable(enable, buf)
  if enable == nil then
    enable = true
  end
  if buf then
    vim.b.autoformat = enable
  else
    vim.g.autoformat = enable
    vim.b.autoformat = nil
  end
  M.info()
end

---@param opts? {force?:boolean, buf?:number}
function M.format(opts)
  opts = opts or {}
  local buf = opts.buf or vim.api.nvim_get_current_buf()
  if not ((opts and opts.force) or M.enabled(buf)) then
    return
  end

  local done = false
  if formatter ~= nil then
    done = true
    Sentinel.try(function()
      return formatter.format(buf)
    end, { msg = "Formatter `" .. formatter.name .. "` failed" })
  end

  if not done and opts and opts.force then
    Sentinel.warn("No formatter available", { title = "Sentinel" })
  end
end

function M.setup()
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('SentinelFormat', {}),
    callback = function(event)
      M.format({ buf = event.buf })
    end
  })

  vim.api.nvim_create_user_command('SentinelFormat', function()
    M.format({ force = true })
  end, { desc = 'Format selection or buffer' })
end

setmetatable(M, {
  _call = function(self, ...)
    return self.format(...)
  end
})

return M
