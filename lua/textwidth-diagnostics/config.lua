local M = {}

M.namespace = vim.api.nvim_create_namespace("textwidth-diagnostics")
M.options = {}

local default = {
  severity = vim.diagnostic.severity.INFO,
}

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", default, options or {})
end

return M
