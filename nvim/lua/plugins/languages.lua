return {
  {
    "ray-x/go.nvim",
    dependencies = {
      {
        "ray-x/guihua.lua",
      },
    },
    config = function()
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require('go.format').goimport()
        end,
        group = format_sync_grp,
      })
    end,
  },
  {
    { "MunifTanjim/prettier.nvim" },
    { "dmmulroy/tsc.nvim" },
    { "p00f/clangd_extensions.nvim" },
  },
}
