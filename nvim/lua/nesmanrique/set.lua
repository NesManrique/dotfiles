-- Save with :W in addition to :w
vim.cmd('command! W write')

-- Set the cursor to be a big white block
vim.opt.guicursor = ""

-- Disable mouse
-- vim.opt.mouse = ""

-- Display line number on the left
vim.opt.nu = true
-- Show rest of line numbers relative to the one were cursor is
vim.opt.relativenumber = true

-- Identation options
-- Condensed way of writing the next block of settings: set ts=2 sw=2 sts=2 st et
-- Number of visual spaces per TAB
vim.opt.tabstop = 2
-- Number of spaces idented when reindent operations (>> and <<) are used
vim.opt.softtabstop = 2
-- Number of spaces in TAB when editing
vim.opt.shiftwidth = 2
-- Convert tab to spaces
vim.opt.expandtab = true

-- Autosmart indent when starting a new line
vim.opt.smartindent = true

-- When on lines longer than the width of the window will wrap
-- When off lines don't wrap and screen scrolls horizontally when
-- going to part not shown.
vim.opt.wrap = false

-- Disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false
-- Setup undo dir and file
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Remove search highlight
vim.opt.hlsearch = false
-- While typing a search command, show where the pattern, as it was typed 
-- so far, matches. 
vim.opt.incsearch = true
-- Use case insensitive search except when using capital letters
vim.opt.ignorecase = true
-- Override the 'ignorecase' option if the search pattern contains upper
-- case characters.
vim.opt.smartcase = true

vim.opt.termguicolors = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Show column 80 colored
vim.opt.colorcolumn = "80"

-- Leader map
vim.g.mapleader = " "

-- folding
vim.opt.foldmethod = "indent"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
