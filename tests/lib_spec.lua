---@diagnostic disable: undefined-global
local Lib = require('utils.lib')

describe("lib", function ()
  it('is_empty', function ()
    local emptystr = ''
    local emptyvar = nil
    local emptytable = {}

    assert.True(Lib.is_empty(emptystr))
    assert.True(Lib.is_empty(emptyvar))
    assert.True(Lib.is_empty(emptytable))
  end)

  it("is_not_empty", function ()
    local nonemptystr = 'I am not empty'
    local nonemptyvar = 123
    local nonemptytable = { test = '1' }

    assert.True(Lib.is_not_empty(nonemptystr))
    assert.True(Lib.is_not_empty(nonemptyvar))
    assert.True(Lib.is_not_empty(nonemptytable))
  end)

  it("merge_tables", function ()
    local on_attach = function(client, bufnr)
      return {client, bufnr}
    end
    local T1 = {
      capabilities = {
        'TestCapability'
      }
    }
    local T2 = {
      on_attach = on_attach
    }
    local MERGED = {
      capabilities = {
        'TestCapability'
      },
      on_attach = on_attach
    }

    assert.same(MERGED, Lib.merge_tables(T1,T2))
  end)
end)
