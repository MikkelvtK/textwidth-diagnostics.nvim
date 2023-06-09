local M = {}

-- TODO: Improve message
function M.format_msg(tw, lw)
  return string.format(
    "line of %d characters exceeds user set textwidth of %d characters",
    lw, tw)
end

function M.print(obj)
  vim.notify(vim.inspect(obj))
end

function M.get_bufnr()
  return vim.api.nvim_get_current_buf()
end

return M
