return {
  {
    "folke/trouble.nvim",
    dependencies = { 
      "nvim-tree/nvim-web-devicons",
      "nvim-mini/mini.icons"
    },
    opts = {},
    config = function(_, opts)
      require("trouble").setup(opts)

      require("which-key").add({
        { "<leader>x", group = "Trouble" },
        { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle" },
        { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
        { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
        { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "QuickFix" },
        { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List" },
        { "<leader>xt", "<cmd>TroubleToggle telescope<cr>", desc = "Telescope" },
        {
          "[t",
          function()
            require("trouble").previous({ skip_groups = true, jump = true })
          end,
          desc = "Previous Trouble",
        },
        {
          "]t",
          function()
            require("trouble").next({ skip_groups = true, jump = true })
          end,
          desc = "Next Trouble",
        },
      })
    end,
  },
}
