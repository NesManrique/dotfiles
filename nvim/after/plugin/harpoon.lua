local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local h = require("helpers")

h.NormalRemap("<leader>a", mark.add_file,{desc = "Add current file to harpoon list"})
h.NormalRemap("<C-e>", ui.toggle_quick_menu, {desc = "Toggle harpoon menu"})

h.NormalRemap("<C-h>", function() ui.nav_file(1) end, {desc = "Navigate to harpoon file 1"})
h.NormalRemap("<C-n>", function() ui.nav_file(2) end, {desc = "Navigate to harpoon file 2"})
h.NormalRemap("<C-m>", function() ui.nav_file(3) end, {desc = "Navigate to harpoon file 3"})
h.NormalRemap("<C-l>", function() ui.nav_file(4) end, {desc = "Navigate to harpoon file 4"})

