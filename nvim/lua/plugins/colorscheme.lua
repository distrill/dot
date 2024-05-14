return {
  {
    "catppuccin/nvim",
    config = function()
      color = color or "catppuccin-mocha"
      vim.cmd.colorscheme(color)
      vim.o.termguicolors = true
      vim.o.background = "dark"
    end
  }
}
