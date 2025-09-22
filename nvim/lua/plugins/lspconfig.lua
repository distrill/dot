return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
      },
      {
        "williamboman/mason-lspconfig.nvim",
      },
      {
        "L3MON4D3/LuaSnip",
        config = function()
          local ls = require 'luasnip'
          vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
          vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
          vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })
        end,
      },
    },
    config = function(opts)
      local lspconfig = require('lspconfig')
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end
      })

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
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      local ensure_installed = {
        'eslint-lsp',
        'gopls',
        'lua-language-server',
        'prettier',
        'typescript-language-server',
      }

      -- diagnostics
      vim.diagnostic.config({
        ensure_installed = ensure_installed,
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
      })
      local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
      vim.diagnostic.config({
        signs = {
          severity = {
            { name = "DiagnosticSignError", text = signs.Error }, -- Replace "E" with your desired icon for Error
            { name = "DiagnosticSignWarn",  text = signs.Warn },  -- Replace "W" with your desired icon for Warn
            { name = "DiagnosticSignInfo",  text = signs.Info },  -- Replace "I" with your desired icon for Info
            { name = "DiagnosticSignHint",  text = signs.Hint },  -- Replace "H" with your desired icon for Hint
          }
        }
      })


      _G.LspDiagnosticsPopupHandler = function()
        local current_cursor = vim.api.nvim_win_get_cursor(0)
        local last_popup_cursor = vim.w.lsp_diagnostics_last_cursor or { nil, nil }

        -- Show the popup diagnostics window,
        -- but only once for the current cursor location (unless moved afterwards).
        if not (current_cursor[1] == last_popup_cursor[1] and current_cursor[2] == last_popup_cursor[2]) then
          vim.w.lsp_diagnostics_last_cursor = current_cursor
          vim.diagnostic.open_float(0, { scope = "cursor" }) -- for neovim 0.6.0+, replaces show_{line,position}_diagnostics
        end
      end
      vim.cmd [[
        augroup LSPDiagnosticsOnHover
          autocmd!
          autocmd CursorHold *   lua _G.LspDiagnosticsPopupHandler()
        augroup END
        ]]


      local default_setup = function(server)
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        require('lspconfig')[server].setup({
          capabilities = capabilities,
        })
      end

      require('mason').setup({
        ensure_installed = ensure_installed,
        ui = {
          border = 'rounded',
        },
      })
      require('mason-lspconfig').setup({
        handlers = {
          default_setup,
        },
      })

      -- undefined global "vim"
      lspconfig['lua_ls'].setup({
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            workspace = {
              -- Make the server aware of Neovim runtime files and plugins
              library = {
                vim.api.nvim_get_runtime_file("", true),
              },
              checkThirdParty = false, -- Avoid warnings about unknown third-party libraries
            },
            diagnostics = {
              globals = { "vim" }, -- Add globals like `vim`
            },
            telemetry = {
              enable = false, -- Disable telemetry to speed things up
            },
          },
        },
      })

      lspconfig.clangd.setup {
        cmd = { "clangd", "--compile-commands-dir=build", "--log=verbose" },
        on_attach = function(client)
          vim.cmd 'setlocal omnifunc=v:lua.vim.lsp.omnifunc'
        end,
        handlers = {
          ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
              virtual_text = false,
              signs = true,
              update_in_insert = false,
            }
          ),
        },
        init_options = {
          clangdFileStatus = true,
        },
        settings = {
          clangd = {
            includePath = { "/home/bh/dev/bhlash/vendor/raylib/src" },
          },
        },
      }

      lspconfig.clojure_lsp.setup({
        cmd = { "clojure-lsp" },
        filetypes = { "clojure", "edn" },
        root_dir = lspconfig.util.root_pattern("deps.edn", "project.clj", ".git"),
      })

      -- lspconfig.erlangls.setup {}

      lspconfig.gleam.setup({})


      -- vim.g.local_lsp_settings = {
      --   ts_ls = {
      --     cmd = {
      --       "docker", "exec", "-i", "nw-migrator",
      --       "node_modules/.bin/typescript-language-server",
      --       "--stdio"
      --     },
      --     root_dir = function(fname)
      --       print("ts_ls root_dir:", fname)
      --       return "/app" -- path *inside* container
      --     end,
      --     on_new_config = function(new_config, _)
      --       new_config.workspace_folders = {
      --         {
      --           name = "migrator",
      --           uri = "file:///app"
      --         }
      --       }
      --       new_config.root_uri = "file:///app"
      --     end
      --   },
      -- }

      -- if vim.g.local_lsp_settings and vim.g.local_lsp_settings.tsserver then
      --   lspconfig.ts_ls.setup(vim.g.local_lsp_settings.ts_ls)
      -- else
      --   lspconfig.ts_ls.setup({})
      -- end
    end,
  },
}

-- vim.g.local_lsp_settings = {
--   ts_ls = {
--     cmd = { "/home/bh/scripts/tsserver-in-docker.sh" }, -- full path to wrapper
--     root_dir = function()
--       return "/app"
--     end,
--     on_new_config = function(new_config, _)
--       new_config.workspace_folders = {
--         {
--           name = "migrator",
--           uri = "file:///app"
--         }
--       }
--       new_config.root_uri = "file:///app"
--     end
--   },
-- }
--
-- if vim.g.local_lsp_settings and vim.g.local_lsp_settings.tsserver then
--   require('lspconfig').ts_ls.setup(vim.g.local_lsp_settings.tsserver)
-- else
--   require('lspconfig').ts_ls.setup({})
-- end
