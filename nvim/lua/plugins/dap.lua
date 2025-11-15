return {
  -- Core DAP
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio", -- needed for async bits
    },
    config = function()
      local dap = require("dap")
      local view = require("dap-view")

      vim.keymap.set("n", "<F5>", dap.continue)
      vim.keymap.set("n", "<F10>", dap.step_over)
      vim.keymap.set("n", "<F11>", dap.step_into)
      vim.keymap.set("n", "<F12>", dap.step_out)

      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Condition: "))
      end)

      vim.keymap.set("n", "<leader>dv", view.open)  -- opens the floating views
      vim.keymap.set("n", "<leader>dV", view.close) -- closes them
      vim.keymap.set("n", "<leader>de", dap.terminate)
    end,
  },

  -- UI (instead of dap-ui)
  {
    "igorlfs/nvim-dap-view",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      -- require("dap-view").setup({
      --   -- tweak to taste
      --   floating = {
      --     border = "rounded",
      --   },
      -- })
    end,
  },

  -- JS/TS debugging
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = {
      "mfussenegger/nvim-dap",
      {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
      },
    },
    config = function()
      require("dap-vscode-js").setup({
        debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
        adapters = { "pwa-node" },
      })

      -- Per-language debug configurations
      local dap = require("dap")

      for _, language in ipairs({ "typescript", "javascript", "typescriptreact" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Current File",
            program = "${file}",
            cwd = "${workspaceFolder}",
            outFiles = { "${workspaceFolder}/dist/**/*.js" },
            sourceMaps = true,
            runtimeExecutable = "node",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach (process)",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}
