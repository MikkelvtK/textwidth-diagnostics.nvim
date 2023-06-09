local M = {}

M.namespace = vim.api.nvim_create_namespace("textwidth-diagnostics")
M.options = {}
M.textwidth = vim.api.nvim_get_option_value("textwidth", {})

local default = {
  severity = "INFO",
}

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", default, options or {})
end

function M.update_textwidth()
  M.textwidth = vim.api.nvim_get_option_value("textwidth", {})
end

return M
