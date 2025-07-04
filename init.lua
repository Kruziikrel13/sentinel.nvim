vim.uv = vim.uv or vim.loop

local opts = {} ---@type SentinelOptions
require("config.lazy").setup()
