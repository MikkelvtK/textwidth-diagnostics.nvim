if vim.g.loaded_textwidth_diagnostics == 1 then
  return
end

local diag_textwidth = require("textwidth-diagnostics")
local group = vim.api.nvim_create_augroup("TextwidthDiagnosticsGroup", {
  clear = true
})
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", }, {
  group = group,
  callback = function()
    if vim.fn.expand("<afile>") ~= "" then
      vim.schedule(diag_textwidth.refresh)
    end
  end,
})

vim.api.nvim_create_user_command("TextwidthDiagnosticsToggle",
  diag_textwidth.toggle, { desc = "Toggle Textwidth Diagnostics", })

vim.g.loaded_textwidth_diagnostics = 1
