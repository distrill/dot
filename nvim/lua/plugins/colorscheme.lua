return {
  "shaunsingh/nord.nvim",
  config = function()
    vim.cmd('colorscheme nord')

    -- vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "WinBarNC", { bg = "NONE" })
    --
    -- -- make the Avante float panel & border visible
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f2335" }) -- pick your panel bg
    -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7aa2f7", bg = "#1f2335" })
    -- vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#a6e3a1", bg = "#1f2335", bold = true })
  end
  -- "sam4llis/nvim-tundra",
  -- config = function()
  --   require('nvim-tundra').setup({
  --   })
  --   vim.g.tundra_biome = 'arctic' -- 'arctic' or 'jungle'
  --   vim.opt.background = 'dark'
  --   vim.cmd('colorscheme tundra')
  -- end

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
