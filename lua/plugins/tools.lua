local configuration = require('configuration')

local startuptime = {}
if configuration.plugins.startuptime then
  -- measure startuptime
  startuptime = {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  }
end

local hardtime = {}
if configuration.plugins.hardtime then
  hardtime = {
    'm4xshen/hardtime.nvim',
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      restriction_mode = 'hint'
    },
    config = true
  }
end

local timespent = {}
if configuration.plugins.timespent then
  timespent = {
    'quentingruber/timespent.nvim',
    cmd = 'ShowTimeSpent'
  }
end


return {
  startuptime,
  hardtime,
  timespent
}
