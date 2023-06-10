local M = {}

-- TODO: Improve message

--- Helper function to format a diagnostic message shown to the user
-- @tparam number tw
-- @tparam number lw
-- @treturn string
function M.format_msg(tw, lw)
  return string.format(
    "line of %d characters exceeds user set textwidth of %d characters",
    lw, tw)
end

--- Helper function for debugging purposes
-- @tparam any type obj
function M.print(obj)
  vim.print(vim.inspect(obj))
end

--- Helper function to get the current buffer number
-- @treturn number
function M.get_bufnr()
  return vim.api.nvim_get_current_buf()
end

--- Helper function get the lines in a buffer
-- @tparam number bufnr
-- @treturn string[]
function M.get_lines(bufnr)
  return vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
end

return M
