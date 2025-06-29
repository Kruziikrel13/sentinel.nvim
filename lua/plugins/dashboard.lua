Sentinel.on_load('snacks.nvim', function()
  -- Create highlights when snacks.nvim loads
  vim.api.nvim_set_hl(0, 'NeovimDashboardLogo1', { fg = '#641220' })
  vim.api.nvim_set_hl(0, 'NeovimDashboardLogo2', { fg = '#6e1423' })
  vim.api.nvim_set_hl(0, 'NeovimDashboardLogo3', { fg = '#85182a' })
  vim.api.nvim_set_hl(0, 'NeovimDashboardLogo4', { fg = '#a11d33' })
  vim.api.nvim_set_hl(0, 'NeovimDashboardLogo5', { fg = '#a71e34' })
  vim.api.nvim_set_hl(0, 'NeovimDashboardLogo6', { fg = '#b21e35' })
  vim.api.nvim_set_hl(0, 'NeovimDashboardLogo7', { fg = '#bd1f36' })
  vim.api.nvim_set_hl(0, 'NeovimDashboardLogo8', { fg = '#c71f37' })
  vim.api.nvim_set_hl(0, 'NeovimDashboardLogo9', { fg = '#da1e37' })
end)


local dashboard_icon =
{
  { '        .*-.       \n', hl = 'NeovimDashboardLogo1'},
  { '    -:   @+  .=    \n', hl = 'NeovimDashboardLogo1'},
  { '  .*-    @=    #-  \n', hl = 'NeovimDashboardLogo2'},
  { ' +@-     @=     %*.\n', hl = 'NeovimDashboardLogo2'},
  { '=@%:     @=     *@*\n', hl = 'NeovimDashboardLogo3'},
  { ' .+@#.   @=   =@*: \n', hl = 'NeovimDashboardLogo3'},
  { '    =%*. @= -%*.   \n', hl = 'NeovimDashboardLogo4'},
  { '      =%*@##+.     \n', hl = 'NeovimDashboardLogo4'},
  { '       =@@@%-      \n', hl = 'NeovimDashboardLogo5'},
  { '     +@#:@*=%#:    \n', hl = 'NeovimDashboardLogo5'},
  { '  .+@%-  @+  =@#-  \n', hl = 'NeovimDashboardLogo6'},
  { '.+@%-    @+   .+@#:\n', hl = 'NeovimDashboardLogo6'},
  { '=@@=     @+    :#@*\n', hl = 'NeovimDashboardLogo7'},
  { '  =%%-   @+  .*@*. \n', hl = 'NeovimDashboardLogo7'},
  { '    =%%- @+ +@#:   \n', hl = 'NeovimDashboardLogo8'},
  { '      =%%@%@#:     \n', hl = 'NeovimDashboardLogo8'},
  { '        -#*:       ', hl = 'NeovimDashboardLogo9'},
}

return {
  'kruziikrel13/snacks.nvim',
  opts = {
    dashboard = { 
      enable = true,
      row = 6,
      sections = {
        { 
          { section = 'header', align = 'center' },
          { section = 'keys', gap = 1, padding = 1 },
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local gh_available = vim.fn.executable('gh') == 1

          if not in_git or not gh_available then
            return
          end

          local sections = {
            {
              section = 'terminal',
              cmd = 'gh contribs -W',
              height = 5,
              enabled = gh_available
            },
            {
              icon = '',
              desc = 'Browse Repo',
              key = 'b',
              action = function()
                Snacks.gitbrowse()
              end,
            },
            {
              section = 'terminal',
              ttl = 5 * 60,
              icon = '',
              title = 'Notifications',
              indent = 3,
              height = 5,
              key = 'N',
              cmd = 'gh notify -s -n5',
              action = function()
                vim.ui.open("https://github.com/notifications")
              end,
              enabled = gh_available
            },
            {
              section = 'terminal',
              ttl = 5 * 60,
              icon = '',
              title = 'Open Issues',
              indent = 3,
              height = 7,
              key = 'i',
              cmd = 'gh issue list -L 3',
              action = function()
                vim.fn.jobstart("gh issue list --web", { detach = true })
              end,
              enabled = in_git and gh_available
            },
            {
              section = 'terminal',
              ttl = 5 * 60,
              icon = '',
              title = 'Open PRs',
              indent = 3,
              height = 7,
              key = 'P',
              cmd = 'gh pr list -L 3',
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              enabled = in_git and gh_available
            },
            {
              section = 'terminal',
              ttl = 5 * 60,
              icon = '',
              title = 'Git Status',
              indent = 3,
              height = 10,
              cmd = "git --no-pager diff --stat -B -M -C",
            }
          }

          return vim.tbl_map(function(cmd)
            return vim.tbl_extend('keep', cmd, {
              pane = 2,
              padding = 1,
              enabled = in_git,
            })
          end, sections)
        end,
        { section = 'startup' },
      },
      preset = { header = dashboard_icon }
    }
  },
  keys = {
    { '<leader>D', function()
      Snacks.dashboard()
    end, desc = 'Dashboard' }
  }
}
