return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    vim.cmd([[
      hi NormalFloat guibg=NONE
      hi FloatBorder guibg=NONE
    ]])

    local opts = {
      keymaps = {
        -- ["q"] = { "actions.close", mode = "n" },
      },
      float = {
        padding = 3, -- padding around the float
      }
    }
    require('oil').setup(opts)
    vim.keymap.set("n", "<leader>f", "<Cmd>Oil --float<CR>")
  end
}
