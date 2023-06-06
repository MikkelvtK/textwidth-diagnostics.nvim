local M = {}

---@class diagnostic
---@field index number
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
function _diagnostic:transform(tw, msg)
  return {
    lnum = self.index - 1,
    end_lnum = self.index - 1,
    col = tw,
    end_col = #self.line,
    message = msg,
    source = "textwidth-diagnostics.nvim",
    severity = vim.diagnostic.severity.INFO,
  }
end

--- Function to collect diagnostics for the lines passed in the
--- parameter lines
-- @tparam string list lines
-- @tparam number tw
-- @tparam string msg
-- @treturn table
function M.get_diagnostics(lines, tw, msg)
  if lines == nil then
    return {}
  end

  local diags = {}
  for index, line in ipairs(lines) do
    if #line > tw then
      local d = _diagnostic:new({ index = index, line = line })
      table.insert(diags, d:transform(tw, msg))
    end
  end

  return diags
end

return M
