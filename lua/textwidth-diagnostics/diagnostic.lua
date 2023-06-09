local util = require("textwidth-diagnostics.util")
local config = require("textwidth-diagnostics.config")

local M = {}

---@class diagnostic
---@field index number
---@field msg string
---@field line string
local _diagnostic = {}

function _diagnostic:new(opts)
  opts = opts or {}
  return setmetatable(opts, { __index = self })
end

--- Function to transform the _diagnostic into a diagnostic
--- table that can be used by Neovim.
-- @tparam number tw
-- @tparam string msg
-- @treturn table
function _diagnostic:transform()
  return {
    lnum = self.index - 1,
    end_lnum = self.index - 1,
    col = config.textwidth,
    end_col = #self.line,
    message = self.msg,
    source = "[textwidth-exceeded]",
    severity = vim.diagnostic.severity[config.options.severity],
  }
end

--- Function to collect diagnostics for the lines passed in the
--- parameter lines
-- @tparam string list lines
-- @tparam number bufnr
function M.create_diagnostics(lines, bufnr)
  if lines == nil then
    return
  end

  local diags = {}
  for index, line in ipairs(lines) do
    if #line > config.textwidth then
      local d = _diagnostic:new({
        index = index,
        line = line,
        msg = util.format_msg(config.textwidth, #line),
      })
      table.insert(diags, d:transform())
    end
  end

  vim.diagnostic.set(config.namespace, bufnr, diags, config.options.diagnostic_opts)
end

return M
