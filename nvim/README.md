# Neovim config

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

