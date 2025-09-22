vim.g.mapleader = " "

-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append next line to this but keep cursor at start
vim.keymap.set("n", "J", "mzJ`z")
-- keep curor middle of screen when page up page down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keep cursor in middle of screen when search for occurrence
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank into void on paste
vim.keymap.set("x", "<leader>p", "\"_dP")

-- yank into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- delete into void
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- sed selected word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- toggle highlight searched text
vim.keymap.set("n", "<C-h>", "<cmd>set hlsearch! <CR>")

-- reload all buffers
vim.keymap.set("n", "<leader>b", "<cmd>bufdo e<CR>")

-- search for selected text
vim.api.nvim_set_keymap('v', '//', [[y/\V<C-r>=escape(@",'/\')<CR><CR>]], { noremap = true })

vim.keymap.set('n', '<leader>z', function()
  vim.cmd('Focus')
end, { desc = 'Call :Focus' })

-- navigate diagnostics
vim.keymap.set("n", "<leader>]", function()
  vim.diagnostic.goto_next({ float = false })
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>[", function()
  vim.diagnostic.goto_prev({ float = false })
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>hh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
