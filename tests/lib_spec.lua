local Lib = require('utils.lib')

describe("lib", function ()
  it("merge_tables", function ()
    local on_attach = function(window, bufnr)
      return {window, bufnr}
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
