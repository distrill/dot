-- fat cursor on insert
vim.opt.guicursor = ""

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tab width
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

-- line wrap
vim.opt.wrap = false

-- misc vim file management
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- prevent cursor from hitting top of window
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- vim.o.cmdheight = 0

-- set status line to be global, spanning the entire width of the terminal window
vim.opt.laststatus = 3


-- no background colors on floating window borders
vim.cmd([[
  hi NormalFloat guibg=NONE
  hi FloatBorder guibg=NONE
]])
