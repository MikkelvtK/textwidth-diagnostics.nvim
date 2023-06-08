local M = {}

-- TODO: Improve message
function M.format_msg(tw, lw)
  return string.format(
    "line of %d characters exceeds user set textwidth of %d characters",
    lw, tw)
end

return M
