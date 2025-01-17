return {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require("ibl").setup({
      scope = {
        enabled = true,
        show_start = false,
      },
    })
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#99BBBD", nocombine = true })
  end,
}
