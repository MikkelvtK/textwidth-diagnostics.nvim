-------------------
--- TEST INPUT
-------------------

local input = {
  test1 = {
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "bbbbbbbbbbbbbbbbbbbbbbbbb",
    "cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc",
    "dddddddddddddddddddddddddddddddddddddddddd",
  }
}

-------------------
--- TESTS
-------------------

local config = require("textwidth-diagnostics.config")
local diagnostic = require("textwidth-diagnostics.diagnostic")
require("textwidth-diagnostics").setup({
  textwidth = 50,
})

describe("textwidth-diagnostics", function()
  it("can be required", function()
    require("textwidth-diagnostics")
  end)

  it("generates diagnostics", function()
    local diags = diagnostic.create_diagnostics(input.test1)
    assert.is.same(2, #diags)
  end)

  it("sets diagnostics", function()
    local diags = diagnostic.create_diagnostics(input.test1)
    diagnostic.set_diagnostics(0, diags)

    local set_diags = vim.diagnostic.get(0, { namespace = config.namespace })
    assert.is.same(2, #set_diags)
  end)
end)
