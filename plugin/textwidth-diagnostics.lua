if vim.g.loaded_textwidth_diagnostics == 1 then
  return
end

local group = vim.api.nvim_create_augroup("TextwidthDiagnosticsGroup", {
  clear = true
})
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", }, {
  group = group,
  callback = function()
    vim.schedule(require("textwidth-diagnostics").refresh)
  end,
})

vim.g.loaded_textwidth_diagnostics = 1
