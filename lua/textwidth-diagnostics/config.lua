local M = {}

M.namespace = vim.api.nvim_create_namespace("textwidth-diagnostics")
M.options = {}

local default = {
  -- Severity of the diagnostic one of 4 values: INFO, ERROR, WARNING, HINT
  severity = "INFO",
  -- Textwidth that the diagnostic needs to take into account, will be set by
  -- vim settings if left nil
  textwidth = nil,
}

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", default, options or {})
end

return M
