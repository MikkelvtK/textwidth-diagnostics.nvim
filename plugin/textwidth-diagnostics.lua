if vim.g.loaded_textwidth_diagnostics == 1 then
  return
end

local group = vim.api.nvim_create_augroup("TextwidthDiagnosticsGroup", {
  clear = true
})
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", }, {
  group = group,
  callback = function()
    if vim.fn.expand("<amatch>") then
      vim.schedule(require("textwidth-diagnostics").refresh)
    end
  end,
})

vim.api.nvim_create_user_command("TextwidthDiagnosticsToggle",
  require("textwidth-diagnostics").toggle, {})

vim.g.loaded_textwidth_diagnostics = 1
