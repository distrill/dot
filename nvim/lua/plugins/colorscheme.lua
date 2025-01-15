return {
  "sam4llis/nvim-tundra",
  config = function()
    require('nvim-tundra').setup({
    })
    vim.g.tundra_biome = 'arctic' -- 'arctic' or 'jungle'
    vim.opt.background = 'dark'
    vim.cmd('colorscheme tundra')
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
