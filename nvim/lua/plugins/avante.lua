return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    -- Use Claude 3.5 Sonnet - best for coding
    provider = "claude",
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        },
      },
    },
    -- Behavior settings
    behaviour = {
      auto_suggestions = false, -- Start with false, enable later if you like it
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false, -- You want control over this
      support_paste_from_clipboard = true,
    },
    -- Key mappings (vim-friendly)
    mappings = {
      ask = "<leader>aa",     -- Main chat toggle
      edit = "<leader>ae",    -- Edit selection with AI
      refresh = "<leader>ar", -- Refresh chat
      --- Diff conflict resolution
      diff = {
        ours = "co",       -- Keep your version
        theirs = "ct",     -- Accept AI suggestion
        all_theirs = "ca", -- Accept all AI changes
        both = "cb",       -- Keep both versions
        cursor = "cc",     -- Interactive conflict resolution
        next = "]x",       -- Next conflict
        prev = "[x",       -- Previous conflict
      },
      -- Inline suggestions (if you enable auto_suggestions)
      suggestion = {
        accept = "<M-l>",  -- Accept suggestion
        next = "<M-]>",    -- Next suggestion
        prev = "<M-[>",    -- Previous suggestion
        dismiss = "<C-]>", -- Dismiss suggestion
      },
      -- Jump between AI-generated blocks
      jump = {
        next = "]]",
        prev = "[[",
      },
    },
    -- Window configuration
    windows = {
      position = "right", -- Sidebar on the right
      wrap = true,
      width = 30,         -- 30% of screen width
      sidebar_header = {
        align = "center",
        rounded = true,
      },
      input = {
        prefix = "> ", -- Prompt prefix
      },
    },
    -- Visual settings
    highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    -- Diff behavior
    diff = {
      autojump = true,
      list_opener = "copen", -- Use quickfix for conflicts
    },
    -- Enable hints
    hints = { enabled = true },
  },
  -- Build from binary (faster than compiling)
  build = "make",
  -- All the dependencies
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    -- Image support for pasting screenshots
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    -- Better markdown rendering in chat
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
