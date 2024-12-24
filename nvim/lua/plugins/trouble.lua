return {
  --   {
  --     "folke/trouble.nvim",
  --     dependencies = {
  --       {
  --         "kyazdani42/nvim-web-devicons",
  --       },
  --     },
  --     config = function()
  --       require("trouble").setup()
  --       vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>")
  --       vim.keymap.set("n", "<leader>T", "<cmd>Trouble diagnostics toggle<CR>")
  --     end,
  --   },
}
