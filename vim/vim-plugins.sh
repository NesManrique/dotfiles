#!/bin/bash

# Copy vimrc
if [ ! -f ~/.vimrc ]; then
  echo "Copying vimrc from repo to Home"
  cp ./dot.vimrc ~/.vimrc
fi

# Pathogen
if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
  echo "Installing Pathogen"
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Color scheme
if [ ! -d ~/.vim/bundle/vim-colors-solarized ]; then
  echo "Installing Solarized color scheme"
  cd ~/.vim/bundle
  git clone git://github.com/altercation/vim-colors-solarized.git
fi

# Pope plugins
declare -a pope_plugins=( "commentary"
  "surround"
  "fugitive"
  "repeat"
  "unimpaired"
  )

mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
for plugin in "${pope_plugins[@]}"; do
  if [ ! -d ~/.vim/pack/tpope/start/$plugin ]; then
    echo "Installing tpope vim-$plugin"
    git clone https://tpope.io/vim/"$plugin".git
    if [ -d "$plugin/doc" ]; then
        vim -u NONE -c "helptags $plugin/doc" -c q
    fi
  fi
done

# Ctrl+P
if [ ! -d ~/.vim/bundle/ctrlp.vim ]; then
  echo "Installing Ctrl+P"
  cd ~/.vim
  git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim
fi

# vim-ripgrep
if [! -d ~/.vim/bundle/vim-ripgrep ]; then
  echo "Installing vim-ripgrep. Remember to install ripgrep itself as well."
  cd ~/.vim
  git clone https://github.com/jremmen/vim-ripgrep bundle/vim-ripgrep
fi

# Other plugins
declare -a opt_plugins=(
  "https://github.com/scrooloose/nerdtree",
  "https://github.com/jistr/vim-nerdtree-tabs",
  "https://github.com/tmhedberg/SimpylFold",
  "https://github.com/vim-scripts/indentpython.vim",
  "http://ctags.sourceforge.net/",
  "https://github.com/majutsushi/tagbar",
  )

