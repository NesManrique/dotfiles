return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local h = require("config.helpers")

      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      require("telescope").load_extension("fzf")

      local telescope_builtin = require("telescope.builtin")
      h.NormalRemap("<C-p>", telescope_builtin.git_files, { desc = "Fuzzy find in git repo" })
      h.NormalRemap("<leader>pf", telescope_builtin.find_files, { desc = "Fuzzy find files in current directory" })
      h.NormalRemap("<leader>pb", telescope_builtin.buffers, { desc = "Fuzzy find in buffers" })
      h.NormalRemap("<leader>pk", telescope_builtin.keymaps, { desc = "Fuzzy find keymaps" })
      h.NormalRemap("<leader>pg", function()
        telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end, { desc = "Fuzzy find with grep" })
    end,
  },
}
