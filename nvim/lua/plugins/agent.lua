return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  init = function()
    vim.keymap.set('t', '<C-w>h', '<C-\\><C-n><C-w>h', { noremap = true })
    vim.keymap.set('t', '<C-w>j', '<C-\\><C-n><C-w>j', { noremap = true })
    vim.keymap.set('t', '<C-w>k', '<C-\\><C-n><C-w>k', { noremap = true })
    vim.keymap.set('t', '<C-w>l', '<C-\\><C-n><C-w>l', { noremap = true })
  end,
  -- config = function()
  --   vim.keymap.set('t', '<C-w>h', '<C-\\><C-n><C-w>h', { noremap = true })
  --   vim.keymap.set('t', '<C-w>j', '<C-\\><C-n><C-w>j', { noremap = true })
  --   vim.keymap.set('t', '<C-w>k', '<C-\\><C-n><C-w>k', { noremap = true })
  --   vim.keymap.set('t', '<C-w>l', '<C-\\><C-n><C-w>l', { noremap = true })
  -- end,
  keys = {
    { "<leader>a",  nil,                              desc = "AI/Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    -- Diff management
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
  },
}
