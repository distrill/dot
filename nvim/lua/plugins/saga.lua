return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({
      symbol_in_winbar = {
        enable = false,
      },
      ui = {
        code_action = '',
      },
      diagnostic = {
        show_code_action = false,
        jump_num_shortcut = true,
      },
    })

    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
    vim.keymap.set('n', 'ca', '<cmd>Lspsaga code_action<CR>')
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  }
}
