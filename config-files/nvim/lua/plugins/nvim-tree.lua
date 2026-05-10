return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local h = require("config.helpers")

      local function my_onattach(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
      end

      require("nvim-tree").setup({
        diagnostics = {
          enable = true,
        },
        update_focused_file = {
          enable = true,
        },
        on_attach = my_onattach,
      })

      vim.g.nvim_tree_disable_window_picker = 1
      h.NormalRemap("<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
    end,
  },
}
