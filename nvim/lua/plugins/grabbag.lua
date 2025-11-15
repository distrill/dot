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
  },
  { -- yank current line to github context
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "gitlinker".setup()
    end
  },
  { -- pretty bits 'n bobs like blinking and flashing on copy paste etc
    "rachartier/tiny-glimmer.nvim",
    event = "VeryLazy",
    priority = 10, -- Low priority to catch other plugins' keybindings
    config = function()
      require("tiny-glimmer").setup()
    end,
  }
}
