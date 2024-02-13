local telescope_builtin = require('telescope.builtin')
-- Search everything on current git repository
vim.keymap.set('n', '<C-p>', telescope_builtin.git_files, { desc = "Fuzzy find in git repo" })
-- Search everything in directory
vim.keymap.set('n', '<leader>pf', telescope_builtin.find_files, { desc = "Fuzzy find files in current directory" })
-- Search buffers
vim.keymap.set('n', '<leader>pb', telescope_builtin.buffers, { desc = "Fuzzy find in git repo" })
-- Search keymaps
vim.keymap.set('n', '<leader>pk', telescope_builtin.keymaps, {})
-- Search using Grep
vim.keymap.set('n', '<leader>pg', function()
  telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
