if vim.g.loaded_textwidth_diagnostics == 1 then
  return
end
vim.g.loaded_textwidth_diagnostics = 1

-- TODO: Create group for autocmd
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.schedule(require("textwidth-diagnostics").init)
  end,
})
