return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "single", -- "single" | "rounded" | "double" | "solid" | "shadow"
        code_action = "",  -- you already had this
      },
      symbol_in_winbar = { enable = false },
      diagnostic = {
        show_code_action = false,
        jump_num_shortcut = true,
      },
      hover = {
        open_link = "gx", -- default; keep or remove
        max_width = 0.7,  -- optional
        max_height = 0.6, -- optional
      },
    })

    -- your mappings
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
    vim.keymap.set("n", "ca", "<cmd>Lspsaga code_action<CR>")
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
