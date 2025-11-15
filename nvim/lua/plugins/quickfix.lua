local function qf_delete_current_and_next()
  -- get qf metadata
  local info = vim.fn.getqflist({ idx = 0, size = 0, items = 0 })
  local idx  = info.idx
  local size = info.size
  if size == 0 or idx == 0 then return end

  -- remember the quickfix window ID if open
  local qf_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "qf" then
      qf_win = win
      break
    end
  end

  -- remove item
  local items = vim.fn.getqflist()
  table.remove(items, idx)
  vim.fn.setqflist({}, 'r', { items = items })

  if #items == 0 then
    -- close qf if empty
    if qf_win and vim.api.nvim_win_is_valid(qf_win) then
      vim.api.nvim_win_close(qf_win, true)
    end
    return
  end

  -- determine new index
  local new_idx = math.min(idx, #items)

  -- ensure the quickfix window is open; if not, open it
  if not qf_win or not vim.api.nvim_win_is_valid(qf_win) then
    vim.cmd("copen")
    -- after opening, find the qf window again
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "qf" then
        qf_win = win
        break
      end
    end
  end

  -- jump focus to qf window
  vim.api.nvim_set_current_win(qf_win)

  -- move cursor to new index (line)
  vim.api.nvim_win_set_cursor(qf_win, { new_idx, 0 })
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
