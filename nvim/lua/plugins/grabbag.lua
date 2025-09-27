return {
  { -- persistent undo
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  { -- toggle comments
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup()
    end,
  },
  { -- git icons in the gutter
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signcolumn = true,
        attach_to_untracked = true,
        trouble = false,
        _on_attach_pre = function()
          vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        end,
      })
    end
  }
}
