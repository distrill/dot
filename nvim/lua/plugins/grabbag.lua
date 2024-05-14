return {
  { -- better quickfix
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
      vim.keymap.set("n", "<leader>p", function()
        vim.diagnostic.setqflist()
      end)
    end,
  },
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
      require("gitsigns").setup()
    end
  },
}
