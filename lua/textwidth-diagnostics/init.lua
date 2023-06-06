--[[

What will this plugin do:
It will give the user informative diagnostic messages whenever their line width
exceeds the textwidth setting in neovim. The user should be able to individually toggle
these messages or toggle them all at once.

Above all else, this plugin should help me understand the neovim landscape!

================================================================================

What do I need?
- New namespace
- Diagnostic settings
  - Starting line number
  - Ending line number
  - Starting column number
  - Ending column number
  - Message
  - Source (my plugin)
  - The severity
- Buffer number (0)
- Options (!!Need to read documentation!!)

EXAMPLE:
  local ns = vim.api.nvim_create_namespace("TestDiag")
  local diag = {
    {
      lnum = 5,
      end_lnum = 7,
      col = 0,
      end_col = 10,
      message = "example",
      soure = "my example plugin",
      severity = vim.diagnostic.severity.ERROR,
    }
  }
  local bufnr = nil
  vim.diagnostic.set(ns, bufnr or 0, diag, opts or {})

]]

local diagnostic = require("textwidth-diagnostics.diagnostic")

local M = {}

function M.setup(_)
  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      local tw = vim.api.nvim_get_option_value("textwidth", {})
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      local diags = diagnostic.get_diagnostics(lines, tw, "Line is too long")
      local ns = vim.api.nvim_create_namespace("Test")
      vim.diagnostic.set(ns, 0, diags, {})
    end
  })
end

return M
