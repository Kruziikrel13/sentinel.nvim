vim.api.nvim_set_hl(0, 'NeovimDashboardLogo1', { fg = '#641220' })
vim.api.nvim_set_hl(0, 'NeovimDashboardLogo2', { fg = '#6e1423' })
vim.api.nvim_set_hl(0, 'NeovimDashboardLogo3', { fg = '#85182a' })
vim.api.nvim_set_hl(0, 'NeovimDashboardLogo4', { fg = '#a11d33' })
vim.api.nvim_set_hl(0, 'NeovimDashboardLogo5', { fg = '#a71e34' })
vim.api.nvim_set_hl(0, 'NeovimDashboardLogo6', { fg = '#b21e35' })
vim.api.nvim_set_hl(0, 'NeovimDashboardLogo7', { fg = '#bd1f36' })
vim.api.nvim_set_hl(0, 'NeovimDashboardLogo8', { fg = '#c71f37' })
vim.api.nvim_set_hl(0, 'NeovimDashboardLogo9', { fg = '#da1e37' })

return {
  'folke/snacks.nvim',
  opts = {
    dashboard = { 
      enable = true,
      sections = {
        { section = 'header', align = 'center' },
        { section = 'startup' }
      },
      preset = {
        header = {
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
      }
    }
  }
}
