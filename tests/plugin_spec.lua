---@diagnostic disable: undefined-global
local Plugins = require('utils.plugins')

describe("plugins", function ()
  it("has", function ()
    assert.True(Plugins.has('mason.nvim'))
  end)

  it("getPlugin", function ()
    assert.are.equal('MasonUpdate', Plugins.getPlugin('mason.nvim').cmd)
    assert.True(Plugins.getPlugin('mason.nvim').config)
  end)

  it('isLoaded', function()
    assert.falsy(Plugins.isLoaded('mason.nvim'))
  end)
end)
