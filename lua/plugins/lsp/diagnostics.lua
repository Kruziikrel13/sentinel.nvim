local configuration = require('configuration')
local inline = {}
if configuration.diagnostics.line == "tiny-inline" then
  inline = {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'LspAttach',
    config = function()
      vim.diagnostic.config({ virtual_text = false })
      require('tiny-inline-diagnostic').setup()
    end
  }
elseif configuration.diagnostics.line == "lsp_lines"  then
  inline = {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      vim.diagnostic.config({ virtual_text = false })
      require('lsp_lines').setup()
    end
  }
end


return { inline,
  {
    'folke/trouble.nvim',
    opts = {},
    keys = {
      { '<leader>ld', function ()
        require('trouble').open({
          mode = 'diagnostics',
          focus = true
        })
      end, desc = 'Workspace Diagnostics' },
    }
  },
  {
    'hedyhli/outline.nvim',
    opts = {},
    keys = {
      { '<leader>lo', function()
        require('outline').toggle()
      end, desc = 'Document Outline'}
    }
  }
}
