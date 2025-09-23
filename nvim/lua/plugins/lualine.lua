return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        -- ... your lualine config
        theme = 'nord'
        -- ... your lualine config
      },
      sections = {
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path, 3 = absolute with `~` for home
          },
        },
      },

    }
  end,
}
