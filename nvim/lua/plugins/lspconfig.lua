return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim" },
      { "mason-org/mason-lspconfig.nvim" },
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
      ---------------------------------------------------------------------
      -- 1) LSP defaults & UI niceties (borders, signs, diagnostics)
      ---------------------------------------------------------------------
      local border = {
        { "╭", "FloatBorder" }, { "─", "FloatBorder" }, { "╮", "FloatBorder" }, { "│", "FloatBorder" },
        { "╯", "FloatBorder" }, { "─", "FloatBorder" }, { "╰", "FloatBorder" }, { "│", "FloatBorder" },
      }
      local orig_open = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}; opts.border = opts.border or border
        return orig_open(contents, syntax, opts, ...)
      end

      -- Diagnostic signs (define once)
      local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN]  = signs.Warn,
            [vim.diagnostic.severity.HINT]  = signs.Hint,
            [vim.diagnostic.severity.INFO]  = signs.Info,
          },
        },
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
      })

      -- Hover diagnostics on CursorHold (your popup handler)
      _G.LspDiagnosticsPopupHandler = function()
        local cur = vim.api.nvim_win_get_cursor(0)
        local last = vim.w.lsp_diagnostics_last_cursor or { nil, nil }
        if cur[1] ~= last[1] or cur[2] ~= last[2] then
          vim.w.lsp_diagnostics_last_cursor = cur
          vim.diagnostic.open_float(0, { scope = "cursor" })
        end
      end
      vim.api.nvim_create_augroup("LSPDiagnosticsOnHover", { clear = true })
      vim.api.nvim_create_autocmd("CursorHold", {
        group = "LSPDiagnosticsOnHover",
        callback = function() _G.LspDiagnosticsPopupHandler() end,
      })

      -- Common keymaps on attach (Neovim suggests doing this via LspAttach) :contentReference[oaicite:3]{index=3}
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
        end,
      })

      ---------------------------------------------------------------------
      -- 2) Mason + mason-lspconfig (auto-install & auto-enable)           --
      --    NOTE: put non-LSP tools (e.g. "prettier") in a separate tool  --
      --    installer; mason-lspconfig tracks *LSP servers* only.         --
      ---------------------------------------------------------------------
      local ensure_servers = {
        "eslint", -- eslint-lsp package → LSP config "eslint"
        "lua_ls",
        "ts_ls",  -- tsserver was renamed to ts_ls in lspconfig
        "clangd",
        "clojure_lsp",
        "typos_lsp",
      }

      require("mason").setup({ ui = { border = "rounded" } })
      require("mason-lspconfig").setup({
        ensure_installed = ensure_servers,
        -- auto-enable installed servers with vim.lsp.enable()
        automatic_enable = true, -- you can pass { exclude = { "..." } } to skip some
      })                         -- :contentReference[oaicite:4]{index=4}

      ---------------------------------------------------------------------
      -- 3) Global capabilities (blink.cmp) applied to ALL servers        --
      ---------------------------------------------------------------------
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", { capabilities = capabilities }) -- merges into every config :contentReference[oaicite:5]{index=5}

      ---------------------------------------------------------------------
      -- 4) Per-server configuration                                      --
      --    Define with vim.lsp.config('<name>', { ... }) then either:    --
      --    - let mason-lspconfig auto-enable, or                         --
      --    - call vim.lsp.enable('<name>') yourself.                     --
      ---------------------------------------------------------------------

      -- Lua (fix “undefined global vim”, JIT runtime, workspace libs)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
          },
        },
      })

      -- Typos
      vim.lsp.config("typos_lsp", {
        cmd_env = { RUST_LOG = "error" },
        init_options = { diagnosticSeverity = "Error" },
      })

      -- Clangd
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--compile-commands-dir=build", "--log=verbose" },
        init_options = { clangdFileStatus = true },
        -- prefer setting diagnostics globally (above), but you can still tweak here
        handlers = {
          ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics,
            { virtual_text = false, signs = true, update_in_insert = false }
          ),
        },
        -- Example include path-like tweak (clangd-specific settings live elsewhere normally)
        root_markers = { "compile_commands.json", ".clangd", ".git" }, -- see lsp docs for root markers :contentReference[oaicite:6]{index=6}
      })

      -- Clojure
      vim.lsp.config("clojure_lsp", {
        cmd = { "clojure-lsp" },
        filetypes = { "clojure", "edn" },
        root_markers = { "deps.edn", "project.clj", ".git" }, -- replace util.root_pattern
      })

      -- Gleam
      vim.lsp.config("gleam", {})

      -- Go
      -- vim.lsp.config("gopls", {})

      -- TypeScript/JS (new name is ts_ls)
      vim.lsp.config("ts_ls", {}) -- mason maps this for you; tsserver → ts_ls :contentReference[oaicite:7]{index=7}

      -- ESLint
      vim.lsp.config("eslint", {})

      -- If you disable mason-lspconfig's automatic_enable, enable manually:
      -- vim.lsp.enable({ "lua_ls", "ts_ls", "gopls", "clangd", "clojure_lsp", "gleam", "eslint", "typos_lsp" })

      -- Borders for hover + signature help
      vim.lsp.handlers["textDocument/hover"] =
          vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

      vim.lsp.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
    end,
  },
}
