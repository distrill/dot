return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({
      header = false,
      winopts = {
        preview = {
          layout = "horizontal",
        }
      },
      previewers = {
        builtin = {
          treesitter = { enable = true }
        }
      },
      keymap = {
        builtin = {
          ['<C-u>'] = 'preview-page-up',
          ['<C-d>'] = 'preview-page-down',
        },
        delta = {
          ['<C-u>'] = 'preview-page-up',
          ['<C-d>'] = 'preview-page-down',
        }
      }
    })

    -- view files in current directory sorted by recently opened
    vim.keymap.set(
      'n',
      '<leader>;',
      function()
        require('fzf-lua').oldfiles({
          cwd = vim.loop.cwd(),
          header = false,
        })
      end,
      { noremap = true, silent = true })

    -- view files in current directory
    vim.keymap.set(
      'n',
      '<leader>:',
      function()
        require('fzf-lua').files({
          header = false
        })
      end,
      { noremap = true, silent = true })

    -- grep file contents
    vim.keymap.set(
      'n',
      '<leader>i',
      function()
        require('fzf-lua').live_grep({
          exec_empty_query = true,
          header = false,
        })
      end,
      { noremap = true, silent = true })

    -- diagnostics in the current buffer
    vim.keymap.set(
      'n',
      '<leader>t',
      function()
        require('fzf-lua').diagnostics_document({
        })
      end,
      { noremap = true, silent = true })

    -- diagnostics in the current workspace
    vim.keymap.set(
      'n',
      '<leader>T',
      function()
        require('fzf-lua').diagnostics_workspace({
        })
      end,
      { noremap = true, silent = true })

    vim.keymap.set(
      'n',
      '<leader>g',
      function()
        require('fzf-lua').git_status({
          -- previewer = 'builtin',
        })
      end,
      { noremap = true, silent = true })
  end
}
