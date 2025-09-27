local function qf_delete_current_and_next()
  local info = vim.fn.getqflist({ idx = 0, size = 0, items = 0 })
  local idx  = info.idx
  local size = info.size
  if size == 0 or idx == 0 then return end

  local items = vim.fn.getqflist()
  table.remove(items, idx)
  vim.fn.setqflist({}, 'r', { items = items })

  local next_idx = math.min(idx, math.max(#items, 1))
  if #items == 0 then
    -- nothing left: close qf window if open
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "qf" then
        vim.api.nvim_win_close(win, true)
      end
    end
  end
end

return { -- better quickfix
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  config = function()
    vim.keymap.set("n", "<leader>xd", function()
      vim.diagnostic.setqflist()
    end)

    vim.keymap.set("n", "<leader>qd", qf_delete_current_and_next, { desc = "Quickfix: delete current item & jump next" })
    -- when inside the quickfix window, use `dd` to delete the focused entry
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "qf",
      callback = function(args)
        vim.keymap.set("n", "dd", function()
          -- move the cursor’s entry to current and reuse the same function
          -- local lnum = vim.api.nvim_win_get_cursor(0)[1]
          -- vim.cmd("cc " .. lnum)
          qf_delete_current_and_next()
        end, { buffer = args.buf, desc = "Quickfix: delete line" })
      end,
    })

    vim.api.nvim_set_hl(0, "BqfPreviewBorder", { bg = "NONE", fg = "#4c566a" })             -- border line
    vim.api.nvim_set_hl(0, "BqfPreviewTitle", { bg = "NONE", fg = "#88c0d0", bold = true }) -- top title
    vim.api.nvim_set_hl(0, "BqfPreviewThumb", { bg = "#4c566a" })                           -- scrollbar thumb
    vim.api.nvim_set_hl(0, "BqfPreviewCursorLine", { bg = "#3b4252" })                      -- line under cursor
    vim.api.nvim_set_hl(0, "Normal", { bg = "#2e3440" })

    vim.keymap.set("n", "<leader>qc", function()
      vim.fn.setqflist({}, 'r')
      vim.cmd("cclose")
    end, { desc = "Quickfix: clear & close" })
  end,
}
