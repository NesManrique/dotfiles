local h = require('helpers')

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
  },
}

require('telescope').load_extension('fzf')

local telescope_builtin = require('telescope.builtin')

-- Search everything on current git repository
h.NormalRemap('<C-p>', telescope_builtin.git_files, { desc = "Fuzzy find in git repo" })
-- Search everything in directory
h.NormalRemap('<leader>pf', telescope_builtin.find_files, { desc = "Fuzzy find files in current directory" })
-- Search buffers
h.NormalRemap('<leader>pb', telescope_builtin.buffers, { desc = "Fuzzy find in git repo" })
-- Search keymaps
h.NormalRemap('<leader>pk', telescope_builtin.keymaps, {desc = "Fuzzy find keymaps" })
-- Search using Grep
h.NormalRemap('<leader>pg', function()
  telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Fuzzy find with grep" })
