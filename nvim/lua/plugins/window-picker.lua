return {
  "s1n7ax/nvim-window-picker",
  opts = {
    hint = 'floating-letter',
    selection_chars = 'abcdefghijkl',
    filter_rules = {
      include_current_win = true, -- Allow selecting the current window
      bo = {
        -- Filter out notification windows
        filetype = { 'notify', 'noice', 'snacks_notif' },
      },
    },
  },
}
