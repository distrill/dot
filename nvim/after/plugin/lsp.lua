local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
  'gopls',
  'graphql',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-Space>"] = cmp.mapping.complete(),
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  if client.name == "eslint" then
    vim.cmd.LspStop('eslint')
    return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      vim.diagnostic.open_float(nil, {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      })
    end
  })
end

lsp.on_attach = on_attach
-- lsp.on_attach(function(client, bufnr)


vim.diagnostic.config({
  virtual_text = true,
})

require 'lspconfig'.graphql.setup {}
require 'lspconfig'.jedi_language_server.setup {}
require 'lspconfig'.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

function OpenDiagnosticIfNoFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  -- THIS IS FOR BUILTIN LSP
  vim.diagnostic.open_float(0, {
    scope = "cursor",
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  })
end

vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua OpenDiagnosticIfNoFloat()",
  group = "lsp_diagnostics_hold",
})

lsp.setup()
