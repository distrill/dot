return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = 'v0.*',

  ---@module 'blink.cmp'
  opts = {
    keymap = {
      -- similar to 'super-tab' but with 'enter' to accept
      preset = 'enter',
    },
    completion = {
      list = {
        -- don't insert selection until manual trigger
        selection = { preselect = false, auto_insert = false },
      },
      menu = {
        border = "rounded",
        draw = { gap = 2 },
      },
      accept = {
        auto_brackets = {
          -- no auto function parens
          enabled = false,
        },
      },
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, via `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      -- optionally disable cmdline completions
      -- cmdline = {},
    },

    -- experimental signature help support
    -- signature = { enabled = true }
  },
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { "sources.default" }
}
