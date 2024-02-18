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
which-key.lua - displays pop up with possible key bindings of the command you started typing

### Plugins I want to configure
autopairs.lua - automatic pairs
indent-blankline.lua - indentation and scope guides
nvim-tree.lua - file explorer tree
nvim-lint.lua - An asynchronous linter plugin for Neovim
trouble.lua - A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
twilight.lua - dims inactive portions of the code you're editing
lualine.lua - status line 

### Plugins I will probably not configure
barbar.lua - tabline
gitsigns.lua - git decorations on buffer in the gutter
neomake.lua - asynchronously run programs.

## Notes

- To refresh your mind on lua syntax go to https://learnxinyminutes.com/docs/lua/
- Files and directories in `lua` directory can be required by lua directly, i.e. having `lua/mydir` you can require it with `require(mydir)` in init.lua 

## Packer (package manager for neovim) must be installed

### Manual installation
Clone Packer repo somewhere on packpath

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```



### Nix

TB
Go to https://github.com/wbthomason/packer.nvim


