local settings = require('configuration')

local startuptime = {}
if settings.enable_startuptime then
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
if settings.enable_hardtime then
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
if settings.enable_timespent then
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
