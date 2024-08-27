return {
  'rcarriga/nvim-dap-ui',
  opts = {},
  config = function(_, opts)
    local dap, dapui = require('dap'), require('dapui')
    dapui.setup(opts)
    dap.listeners.before.attach.dapui_config = function()
      dapui.open({})
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close({})
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close({})
    end
  end,
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  keys = {
    { '<leader>du', function()
      require('dapui').toggle()
    end, desc = "Toggle Dap UI" }
  }
}
