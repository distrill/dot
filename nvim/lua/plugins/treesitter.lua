return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- The default markdown injections include a fenced-code rule using the
      -- set-lang-from-info-string! directive, which crashes on stale nodes in LSP
      -- hover popups. Re-declare the query WITHOUT that rule, but keep the
      -- markdown_inline injection so bold/italic/inline-code still render.
      vim.treesitter.query.set("markdown", "injections", [[
        ([
          (inline)
          (pipe_table_cell)
        ] @injection.content
          (#set! injection.language "markdown_inline"))

        ((html_block) @injection.content
          (#set! injection.language "html")
          (#set! injection.combined)
          (#set! injection.include-children))

        ((minus_metadata) @injection.content
          (#set! injection.language "yaml")
          (#offset! @injection.content 1 0 -1 0)
          (#set! injection.include-children))

        ((plus_metadata) @injection.content
          (#set! injection.language "toml")
          (#offset! @injection.content 1 0 -1 0)
          (#set! injection.include-children))
      ]])
      vim.treesitter.query.set("markdown_inline", "injections", "")

      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "go", "ocaml", "regex" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          disable = { "markdown", "markdown_inline" },
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },
}
