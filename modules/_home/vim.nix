{ ... }: {
  home.file.".vimrc".source = ../../config-files/vim/dot.vimrc;
  xdg.configFile."vim/vimrc.minimal".source = ../../config-files/vim/dot.vimrc.minimal;
}
