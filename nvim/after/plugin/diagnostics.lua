vim.keymap.set("n", "<leader>t", "<cmd>TroubleToggle document_diagnostics<CR>")
vim.keymap.set("n", "<leader>T", "<cmd>TroubleToggle workspace_diagnostics<CR>")

vim.keymap.set("n", "<leader>p", function()
  vim.diagnostic.setqflist()
end)
