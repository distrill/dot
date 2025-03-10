local function open_in_selected_window(prompt_bufnr)
  local search_term = ""
  local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
  if picker then
    search_term = picker:_get_prompt()
  end


  local entry = require("telescope.actions.state").get_selected_entry()
  if not entry then return end

  local filename = entry.filename or entry.value

  require("telescope.actions").close(prompt_bufnr)

  -- get the window id to open the file into
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
    vim.cmd("edit " .. filename)

    local picker_name = picker and picker.prompt_title or ""
    if picker_name == "Live Grep" then
      local line = entry.lnum or 1
      local col = entry.col or 0

      vim.api.nvim_win_set_cursor(0, { line, col + 1 }) -- move cursor to line and column that were in the picker match result
      vim.fn.setreg("/", "\\c" .. search_term)          -- set the search register to the picker search term
      vim.o.hlsearch = true                             -- highlight the search term
      vim.cmd("normal! NNnl")                           -- hackery to trigger the iterative search hints and ensure the cursor is at the start of the search term
    end
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
