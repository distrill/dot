return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
      },
    },
    config = function()
      require('nvim-tree').setup({
        filters = {
          dotfiles = true,
        },
      })

      -- disable janky ass netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- keybindings
      vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)
      vim.keymap.set("n", "<leader>b", vim.cmd.NvimTreeFindFile)
      vim.keymap.set("n", "<C-m>", vim.cmd.NvimTreeFocus)

      -- close nvim if the last buffer open
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
        pattern = "NvimTree_*",
        callback = function()
          local layout = vim.api.nvim_call_function("winlayout", {})
          if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then
            vim.cmd("confirm quit")
          end
        end
      })
    end,
  }
}
