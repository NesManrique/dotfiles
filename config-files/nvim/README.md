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

- Remember lazyvim is a plugin manager and it's different from LazyVim which is a Neovim configuration framework built on top of the lazy plugin manager.
- In this repository I will be using lazyvim as a plugin manager, but I will not be using the LazyVim configuration framework.
- That means I am adding plugins one by one in lua/plugins and configuring them accordingly.
- To refresh your mind on lua syntax go to
[learnxinyminutes]("https://learnxinyminutes.com/docs/lua/")
- Files and directories in `lua` directory can be required by lua directly,
i.e. having `lua/mydir` you can require it with `require(mydir)` in init.lua

## Current layout

- `init.lua` loads the base config from `lua/config`
- `lua/config/lazy.lua` bootstraps `lazy.nvim` and loads plugin specs from
  `lua/plugins`
- each file in `lua/plugins` is the source of truth for a plugin or a related
  plugin group
- shared helpers live in `lua/config/helpers.lua`

## Current plugin structure

- `lua/plugins/telescope.lua` owns both Telescope and
  `telescope-fzf-native.nvim`
- `lua/plugins/treesitter.lua` owns Treesitter install and setup
- `lua/plugins/lsp.lua` owns `nvim-lspconfig`, Mason, Mason LSP config, and
  related LSP setup
- `lua/plugins/cmp.lua` owns `nvim-cmp`, LuaSnip, and cmp sources
- `lua/plugins/fugitive.lua` currently groups several classic Vim plugins:
  fugitive, commentary, repeat, surround, and unimpaired

## Useful commands

- `:Lazy` opens the plugin manager UI
- `:Lazy sync` installs or updates plugins
- `:Lazy build telescope-fzf-native.nvim` rebuilds Telescope's native fzf
  extension if `libfzf.so` is missing
- `:checkhealth` is the first place to look when startup breaks after updates
- `:checkhealth which-key` is especially useful after changing keymap specs
- `:messages` shows startup errors after they disappear from the screen

## Plugin config conventions

- Prefer putting plugin declaration and plugin configuration in the same file
  under `lua/plugins`
- Avoid mixing `lazy.nvim` specs with old `after/plugin` runtime config
- Prefer plugin public APIs over reaching into internal modules
- New `which-key` mappings should use `require("which-key").add(...)` rather
  than the old `register(...)` nested format

## Update notes

- `mason-lspconfig.nvim` no longer uses `setup_handlers()` in the newer API
- recent `nvim-treesitter` uses `require("nvim-treesitter").setup(...)` or
  `require("nvim-treesitter.config").setup(...)`; older
  `require("nvim-treesitter.configs")` usage can break after updates
- `nvim-tree` internals move around, so prefer configuring through
  `require("nvim-tree").setup(...)` and the public API in `nvim-tree.api`
- when a plugin starts failing after an update, first check whether the API
  changed before assuming the install is broken

## WSL and VS Code

- VS Code in a WSL remote window may still start `bash` even if Neovim and
  Home Manager are configured for `zsh`
- if shell-specific plugin behavior seems missing, verify VS Code is actually
  launching `zsh`
- WSL VS Code machine settings are separate from Windows VS Code user settings

## Nix-specific gotchas

### Nix

- This config is managed through Home Manager, so files linked directly from
  the Nix store are read-only
- do not manage mutable Neovim state files like `lazy-lock.json` as
  store-backed files if plugins need to update them
- if a plugin wants to compile native code, the machine needs a compiler
  available globally, for example `gcc` in the Home Manager package list
- shell tools like `fzf` being installed globally does not automatically solve
  native plugin build requirements such as `telescope-fzf-native.nvim`
