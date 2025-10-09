return {
  "shaunsingh/nord.nvim",
  config = function()
    vim.cmd('colorscheme nord')

    -- enable transparent background
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    vim.api.nvim_set_hl(0, "Visual", { bg = "#81a1c1", fg = "#2E3440" })
  end

  -- "rebelot/kanagawa.nvim",
  -- config = function()
  --   require("kanagawa").setup()
  --   vim.cmd("colorscheme kanagawa")
  -- end,

  -- "catppuccin/nvim",
  -- config = function()
  --   require("catppuccin").setup({
  --     transparent_background = true,
  --     integrations = {
  --       fzf = true, -- Enable Catppuccin for fzf-lua
  --     }
  --   })
  --   vim.cmd.colorscheme("catppuccin-frappe")
  --   vim.o.termguicolors = true
  --   vim.o.background = "dark"
  -- end
}
