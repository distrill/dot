return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- recommended by the plugin; loads its own filetype logic
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("markview").setup({
      -- render everything, including the line the cursor is on (best for reading).
      -- add `hybrid_modes = { "n" }` back if you want the cursor line shown as raw text while editing.
      preview = {
        modes = { "n", "no", "c" },
      },
    })

    -- toggle all rendering on/off
    vim.keymap.set("n", "<leader>m", "<Cmd>Markview toggle<CR>", { desc = "Toggle markview" })
    -- toggle hybrid (raw cursor line) mode for when you switch from reading to editing
    vim.keymap.set("n", "<leader>M", "<Cmd>Markview hybridToggle<CR>", { desc = "Toggle markview hybrid mode" })
  end,
}
