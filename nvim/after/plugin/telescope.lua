require('telescope').setup{
	defaults = {
		file_ignore_patterns = { "node_modules" }
	}
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', ';', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.buffers, {})
vim.keymap.set('n', '<leader>i', function()
	builtin.grep_string({ search = "" })
end)
vim.keymap.set('n', '<C-i>', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
