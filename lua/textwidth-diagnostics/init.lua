--[[

What will this plugin do:
It will give the user informative diagnostic messages whenever their line width
exceeds the textwidth setting in neovim. The user should be able to individually toggle
these messages or toggle them all at once.

Above all else, this plugin should help me understand the neovim landscape!

]]

local diagnostic = require("textwidth-diagnostics.diagnostic")
local config = require("textwidth-diagnostics.config")

local M = {}

function M.refresh()

end

function M.start()

end

function M.init()
  local tw = vim.api.nvim_get_option_value("textwidth", {})
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local diags = diagnostic.get_diagnostics(lines, tw)
  vim.diagnostic.set(config.namespace, 0, diags, {})
end

function M.setup(options)
  config.setup(options)
end

return M
