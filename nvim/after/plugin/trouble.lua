local wk = require("which-key")
wk.register({
  x = {
    name = "Trouble",
    x = { "<cmd>TroubleToggle<cr>", "Toggle" },
    w = {
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      "Workpsace Diagnostics"
    },
    d = {
      "<cmd>TroubleToggle document_diagnostics<cr>",
      "Document Diagnostics"
    },
    q = { "<cmd>TroubleToggle quickfix<cr>", "QuickFix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "Location List" },
    t = { "<cmd>TroubleToggle telescope<cr>", "Telescope" }
  }
}, {
  prefix = "<leader>"
})

wk.register({
  ['['] = {
    x = {
      ':lua require("trouble").previous({skip_groups = true, jump = true})<CR>',
      "Previous Trouble"
    }
  },
  [']'] = {
    x = {
      ':lua require("trouble").next({skip_groups = true, jump = true})<CR>',
      "Next Trouble"
    }
  }
}, {
  prefix = ""
})
