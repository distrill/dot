local function open_in_selected_window(prompt_bufnr)
  require("telescope.actions").close(prompt_bufnr)

  local entry = require("telescope.actions.state").get_selected_entry()
  if not entry then return end

  local winid = require('window-picker').pick_window({
    hint = 'floating-letter',
    show_prompt = false,
    filter_rules = {
      include_current_win = true,
      bo = {
        buftype = { "terminal", "nofile", "quickfix", "prompt" },
      },
      ft = { "TelescopePrompt" },
    },
  })

  if winid then
    vim.api.nvim_set_current_win(winid)
    vim.cmd("edit " .. entry.value)
  end
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { "node_modules", "vendor", "build", "dist" },
          mappings = {
            i = {
              ["<CR>"] = open_in_selected_window,
            },
            n = {
              ["<CR>"] = open_in_selected_window,
            },
          }
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
