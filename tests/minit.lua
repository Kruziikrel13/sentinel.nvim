#!/usr/bin/env -S nvim -l

vim.env.LAZY_STDPATH = ".tests"
load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"))()

vim.opt.rtp:prepend(".")

-- Setup lazy.nvim
require("lazy.minit").setup({
  spec = {
    { dir = vim.uv.cwd() },
    { -- for Plugins test
      'williamboman/mason.nvim',
      cmd = 'MasonUpdate',
      config = true
    }
  },
})
