local function module(name)
  return require('plugins.debugging.' .. name)
end

local icons = {
  Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
  Breakpoint = " ",
  BreakpointCondition = " ",
  BreakpointRejected = { " ", "DiagnosticError" },
  LogPoint = ".>",
}

return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local DebugUtils = require('util.debugging')
      require('dap').adapters = DebugUtils.adapters
      require('dap').configurations = DebugUtils.configurations

      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
      for name, sign in pairs(icons) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
    end,
    enabled = function()
      return require('util.debugging').debugging
    end,
    keys = {
      { '<leader>dbb', function()
        require('dap').toggle_breakpoint()
      end, desc = 'Toggle Breakpoint' },
      { '<leader>dbc', function()
        require('dap').clear_breakpoints()
      end, desc = 'Clear Breakpoints' },
      { '<leader>dbl', function()
        require('dap').list_breakpoints()
      end, desc = 'List Breakpoints' },
      { '<leader>dc', function()
        require('dap').continue()
      end, desc = 'Continue' },
      { '<leader>dr', function()
        require('dap').restart()
      end, desc = 'Restart' },
      { '<leader>di', function()
        require('dap').step_into()
      end, desc = 'Step In' },
      { '<leader>do', function()
        require('dap').step_out()
      end, desc = 'Step Out' },
      { '<leader>dx', function()
        require('dap').terminate()
      end, desc = 'Close' }
    },
    specs = { module('ui') }
  }
}
