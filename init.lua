vim.uv = vim.uv or vim.loop

vim.opt.background = "dark"
local opts = nil ---@type SentinelOptions
require("lazy").setup(opts)
