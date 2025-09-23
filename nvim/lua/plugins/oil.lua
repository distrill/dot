return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.cmd([[
      hi NormalFloat guibg=NONE
      hi FloatBorder guibg=NONE
    ]])

    local oil = require('oil')

    oil.setup({
      keymaps = {
        ["<CR>"] = function()
          local entry = oil.get_cursor_entry()
          if not entry then
            return
          end

          local dir = oil.get_current_dir()
          local path = vim.fs.joinpath(dir, entry.name)

          if entry.type == "directory" then
            oil.open(path)
          elseif entry.type == "file" then
            oil.close({ exit_if_last_buf = false })
            local win = require("window-picker").pick_window({
              filter_rules = {
                autoselect_one = true,
                include_current_win = true,
                bo = {
                  -- Filter out notification windows
                  filetype = { 'notify', 'noice', 'snacks_notif' },
                },
              },
            })

            if win then
              vim.api.nvim_set_current_win(win)
              vim.cmd.edit(path)
            end
          end
        end,
      },
      float = {
        padding = 3,
      }
    })
    vim.keymap.set("n", "<leader>f", "<Cmd>Oil --float<CR>")
    vim.keymap.set("n", "<leader>F", function()
      require("oil").open_float(vim.fn.getcwd())
    end, { desc = "Open Oil in working directory" })
  end
}
