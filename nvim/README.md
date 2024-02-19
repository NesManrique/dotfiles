# Neovim config

## What do I need

- Package manager    - packer/lazy
- Code Highlightning - treesitter
- LSP                - lspzero
    - Linter          - managed with mason
    - Formatter       - managed with mason
    - Static Analysis - managed with mason + nvim-lsp-config + mason-lspconfig
    - Autocompletion  - nvim-cmp
- Fuzzy finder       - telescope
- File explorer/tree - have to pick one, seems like moving away from netrw is a good idea
- Color scheme       - same as theprimeagen for now (rosebud)

## From david's config

### Plugins I already configured

telescope.lua - fuzzy finder
completion.lua - nvim-cmp
treesitter.lua - highlightning
language-client.lua - nvim-lsp-config
ultisnips.lua - solution for snippets in Vim
which-key.lua - displays pop up with possible key bindings of the command you
started typing
lualine.lua - status line
nvim-lint.lua - An asynchronous linter plugin for Neovim
nvim-tree.lua - file explorer tree
indent-blankline.lua - indentation and scope guides
trouble.lua - A pretty list for showing diagnostics, references, telescope
results, quickfix and location lists to help you solve all the trouble your
code is causing.
autopairs.lua - automatic pairs

### Plugins I want to configure

twilight.lua - dims inactive portions of the code you're editing

### Plugins I will probably not configure

barbar.lua - tabline
gitsigns.lua - git decorations on buffer in the gutter
neomake.lua - asynchronously run programs.

## Notes

- To refresh your mind on lua syntax go to
[learnxinyminutes]("https://learnxinyminutes.com/docs/lua/")
- Files and directories in `lua` directory can be required by lua directly,
i.e. having `lua/mydir` you can require it with `require(mydir)` in init.lua

### Nix
