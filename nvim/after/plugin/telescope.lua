require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules" }
  }
}

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>;', telescope.find_files, {})
vim.keymap.set('n', '<C-p>', telescope.buffers, {})
vim.keymap.set('n', '<leader>i', telescope.grep_string, {})
vim.keymap.set('n', '<C-i>', telescope.live_grep, {})
