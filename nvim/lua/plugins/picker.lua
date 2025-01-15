return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { "node_modules", "vendor", "build", "dist" }
        }
      }

      local telescope = require('telescope.builtin')
      vim.keymap.set('n', '<leader>;', telescope.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>p', telescope.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>g', telescope.git_status, { desc = 'Telescope git status' })
      vim.keymap.set('n', '<leader>gg', telescope.git_commits, { desc = 'Telescope git status' })

      vim.keymap.set('n', '<leader>i', telescope.live_grep, { desc = 'Telescope live grep' })
    end,
  },
}
