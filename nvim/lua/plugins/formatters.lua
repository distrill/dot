return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "luarocks" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          javascript = { "prettierd", "prettier" },
          javascriptreact = { "prettierd", "prettier" },
          typescript = { "prettierd", "prettier" },
          typescriptreact = { "prettierd", "prettier" },
          css = { "prettierd", "prettier" },
          cs = { "csharpier" },
          -- cs = { "dotnet_format" },
        },
        format_after_save = {
          -- These options will be passed to conform.format()
          lsp_fallback = true,
          async = true
        },
        formatters = {
          dotnet_format = {
            command = "dotnet",
            args = { "format", "--include", "$FILENAME" },
            stdin = false,
          },
          csharpier = {
            command = "csharpier",
            args = { "format", "$FILENAME" }, -- in-place
            stdin = false,                    -- IMPORTANT: no stdin for your build
            cwd = require("conform.util").root_file({ "global.json", "*.sln", "*.csproj", ".git" }),
          },
        },
      })
    end,
  },
}
