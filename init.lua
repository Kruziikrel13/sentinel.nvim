vim.uv = vim.uv or vim.loop

vim.opt.background = "dark"
local opts = nil ---@type SentinelOptions
require("config.lazy").setup(opts)
