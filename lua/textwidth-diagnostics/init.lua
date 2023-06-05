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

local M = {}

return M
