return {
  {
    "folke/trouble.nvim",
    dependencies = {
      {
        "kyazdani42/nvim-web-devicons",
      },
    },
    config = function()
      require("trouble").setup()
      vim.keymap.set("n", "<leader>t", "<cmd>TroubleToggle document_diagnostics<CR>")
      vim.keymap.set("n", "<leader>T", "<cmd>TroubleToggle workspace_diagnostics<CR>")
    end,
  },
}
