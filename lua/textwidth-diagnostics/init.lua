--[[

What will this plugin do:
It will give the user informative diagnostic messages whenever their line width
exceeds the textwidth setting in neovim. The user should be able to individually toggle
these messages or toggle them all at once.

Above all else, this plugin should help me understand the neovim landscape!

]]

local diagnostic = require("textwidth-diagnostics.diagnostic")
local config = require("textwidth-diagnostics.config")
local util = require("textwidth-diagnostics.util")

local M = {}

function M.refresh()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  diagnostic.create_diagnostics(lines, bufnr)
end

-- TODO: Create popup with diagnostics results
function M.toggle()
  local bufnr = util.get_bufnr()
  if vim.diagnostic.is_disabled(bufnr, config.namespace) then
    vim.diagnostic.enable(bufnr, config.namespace)
    M.refresh()
  else
    vim.diagnostic.disable(bufnr, config.namespace)
  end
end

function M.setup(options)
  config.setup(options)

  local bufnr = util.get_bufnr()
  vim.diagnostic.disable(bufnr, config.namespace)
end

return M
