local settings = require('configuration')
return {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    opts = {
        dim_inactive = true
    },
    config = function(_, opts)
        local module = require('github-theme')
        module.setup(opts)
        module.compile()
        vim.cmd.colorscheme('github_' .. settings.mode .. '_default')
    end
}
