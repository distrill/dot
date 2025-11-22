return {
  { -- better quickfix
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
      vim.keymap.set("n", "<leader>p", function()
        vim.diagnostic.setqflist()
      end)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "qf",
        callback = function()
          vim.keymap.set("n", "d", function()
            local idx = vim.fn.line(".") - 1
            local qflist = vim.fn.getqflist()
            table.remove(qflist, idx + 1) -- Lua index is 1-based
            vim.fn.setqflist(qflist, 'r') -- 'r' = replace
          end, { buffer = true })
        end,
      })
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
  { -- pretty bits n bobs
    "rachartier/tiny-glimmer.nvim",
    event = "VeryLazy",
    priority = 10, -- Low priority to catch other plugins' keybindings
    config = function()
      require("tiny-glimmer").setup({
        overwrite = {
          yank = {
            enabled = true,
            default_animation = "pulse",
          },
          paste = {
            enabled = true,
            default_animation = "pulse",
          },
        },
        animations = {
          pulse = {
            pulse_count = 1,
          },
        },
      })
    end,
  },

}
