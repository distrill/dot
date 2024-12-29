return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      integrations = {
        fzf = true, -- Enable Catppuccin for fzf-lua
      }
    })
    vim.cmd.colorscheme("catppuccin-frappe")
    vim.o.termguicolors = true
    vim.o.background = "dark"
  end
}
