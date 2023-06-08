if vim.g.loaded_textwidth_diagnostics == 1 then
  return
end
vim.g.loaded_textwidth_diagnostics = 1

local group = vim.api.nvim_create_augroup("TextwidthDiagnosticsGroup", {
  clear = true
})
vim.api.nvim_create_autocmd("InsertLeave", {
  group = group,
  callback = function()
    vim.schedule(require("textwidth-diagnostics").init)
  end,
})
