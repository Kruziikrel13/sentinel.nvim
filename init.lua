vim.uv = vim.uv or vim.loop

local opts = nil ---@type SentinelOptions
require("config.lazy").setup(opts)
