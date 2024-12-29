return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local path = require('fzf-lua').path

    require("fzf-lua").setup({
      header     = false,
      fzf_colors = {
        ["gutter"] = "-1",
        ["pointer"] = { "fg", "Normal" },
        -- ["border"] = { "fg", "Normal" },
      },
      hls        = {
        border = "Normal",
      },
      winopts    = {
        border = 'rounded',
        preview = {
          layout = "horizontal",
        },
      },
      previewers = {
        builtin = {
          treesitter = { enabled = true }
        }
      },
      oldfiles   = {
        include_current_session = true,
      },
      keymap     = {
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

    local desc = "FZF view files in current directory sorted by recently opened"
    vim.keymap.set(
      'n',
      '<leader>p',
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
      '<leader>;',
      function()
        require('fzf-lua').files({
          header = false
        })
      end,
      { desc = desc, noremap = true, silent = true }
    )

    desc = "FZF grep file contents"
    vim.keymap.set(
      'n',
      '<leader>i',
      function()
        require('fzf-lua').live_grep({
          exec_empty_query = true,
          header = false,
        })
      end,
      { desc = desc, noremap = true, silent = true }
    )

    desc = "FZF diagnostics in the current buffer"
    vim.keymap.set(
      'n',
      '<leader>t',
      function()
        require('fzf-lua').diagnostics_document({
        })
      end,
      { desc = desc, noremap = true, silent = true }
    )

    desc = "FZF diagnostics in the current workspace"
    vim.keymap.set(
      'n',
      '<leader>T',
      function()
        require('fzf-lua').diagnostics_workspace({
        })
      end,
      {
        desc = desc,
        noremap = true,
        silent = true,
      })

    desc = "FZF git files and diffs"
    vim.keymap.set(
      'n',
      '<leader>g',
      function()
        require('fzf-lua').git_status({
          -- previewer = 'builtin',
        })
      end,
      { desc = desc, noremap = true, silent = true }
    )

    desc = "FZF find file and open parent in Oil"
    vim.keymap.set(
      "n",
      "<leader>v",
      function()
        require('fzf-lua').files({
          header = false,
          actions = {
            ["default"] = function(allselected)
              -- Ensure we have a valid selection
              local selected = path.entry_to_file(allselected[1]).path
              if not selected or selected == "" then
                return
              end


              -- Get the parent directory of the selected file
              local file_path = vim.fn.fnamemodify(selected, ":p:h")
              file_path = vim.fn.simplify(file_path)
              file_path = vim.fn.fnameescape(file_path)

              -- Open the parent directory in oil.nvim
              -- use vim cmd to get configured oil instance
              vim.cmd("Oil --float " .. file_path)
            end,
          },
        })
      end,
      { desc = desc, noremap = true, silent = true }
    )
  end
}
