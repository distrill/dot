return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp = require("lspconfig")
      -- Godot’s built-in language server
      lsp.gdscript.setup({})
    end,
  },
  {
    "habamax/vim-godot",
    ft = { "gd", "gdscript", "gsl" },
  }

}
