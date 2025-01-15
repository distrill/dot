return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "L3MON4D3/LuaSnip",
        config = function()
          local ls = require("luasnip")
          vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
          vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
          vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })
        end,
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      -- LSP Keybindings
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = { buffer = event.buf }
          local keymaps = {
            { "n",          "gd",   vim.lsp.buf.definition },
            { "n",          "gD",   vim.lsp.buf.declaration },
            { "n",          "gi",   vim.lsp.buf.implementation },
            { "n",          "go",   vim.lsp.buf.type_definition },
            { "n",          "gr",   vim.lsp.buf.references },
            { "n",          "gs",   vim.lsp.buf.signature_help },
            { "n",          "<F2>", vim.lsp.buf.rename },
            { { "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end },
            { "n",          "<F4>", vim.lsp.buf.code_action },
          }
          for _, map in ipairs(keymaps) do
            vim.keymap.set(map[1], map[2], map[3], opts)
          end
        end,
      })

      -- Floating Border for Diagnostics
      local border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      }
      local original_open_floating_preview = vim.lsp.util.open_floating_preview
      vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return original_open_floating_preview(contents, syntax, opts, ...)
      end

      -- Diagnostic Settings
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
      })
      local diagnostic_signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
      for type, icon in pairs(diagnostic_signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl })
      end

      -- Mason Configuration
      mason.setup({ ui = { border = "rounded" } })
      mason_lspconfig.setup({
        ensure_installed = {
          "eslint-lsp",
          "gopls",
          "lua-language-server",
          "typescript-language-server",
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({})
          end,
        },
      })

      -- Specific Server Configurations
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      lspconfig.clangd.setup({
        cmd = { "clangd", "--compile-commands-dir=build", "--log=verbose" },
        handlers = {
          ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics,
            { virtual_text = false, signs = true, update_in_insert = false }
          ),
        },
      })

      lspconfig.clojure_lsp.setup({
        cmd = { "clojure-lsp" },
        filetypes = { "clojure", "edn" },
        root_dir = lspconfig.util.root_pattern("deps.edn", "project.clj", ".git"),
      })

      lspconfig.typos_lsp.setup({
        cmd_env = { RUST_LOG = "error" },
        init_options = { diagnosticSeverity = "Error" },
      })
    end,
  },
}
