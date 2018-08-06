# dotfiles
My hidden configuration files

# Rough install/config guide for reference

## Configuring OSX working environment

### Config iterm2
	[x] download iterm2
	[x] Download solarized dark patched color scheme. https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/schemes

### Config zsh + ohmyzsh + powerlinelvl9k
	[x] brew install zsh zsh-completions
	[x] add /usr/local/bin/zsh to /etc/shells
	[x] chsh -s $(which zsh)
	[x] sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	[x] copy .zshrc file to home
	[x] Install powerlvl9k: 
		$ git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
	[x] Install powerline fonts:
		$ brew install python
		$ git clone https://github.com/powerline/fonts
		[optional] $ brew search powerline (to check the list of fonts)
		$ brew cask install homebrew/cask-fonts/font-source-code-pro-for-powerline
	[x] Select font in iterm2: Preference > Profile > Text
	[x] Follow steps in: https://github.com/gabrielelana/awesome-terminal-fonts/wiki/OS-X
	[] Download plugins:
		

### Config vim
	[x] Copy .vimrc to home
	[x] Install pathogen
	[] Download plugins:
		[x] vim-colors-solarized
		[x] vim-commentary
		[x] vim-surround
		[x] vim-fugitive
		[x] vim-repeat
		[x] vim-unimpaired
		[] ctrlp

### Config Git
