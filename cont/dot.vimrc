""" PATHOGEN
execute pathogen#infect()
" VIM Plugins
"
"   Terminal color scheme - https://github.com/altercation/vim-colors-solarized (also to be set in iterm2)
"   Vim Commentary - https://github.com/tpope/vim-commentary
"   Vim Surround - https://github.com/tpope/vim-surround
"   Git itegration - https://github.com/tpope/vim-fugitive
"   Vim Repeat - https://github.com/tpope/vim-repeat
"   Vim Unimpaired - https://github.com/tpope/vim-unimpaired
"
" Optionals
"   NERDTree File Browser - https://github.com/scrooloose/nerdtree
"   NERDTree and tabs together in Vim, painlessly - https://github.com/jistr/vim-nerdtree-tabs
"   Omnisearch in VIM - https://github.com/ctrlpvim/ctrlp.vim
"
"   print req_plugins
"   Folding methods and clasess - https://github.com/tmhedberg/SimpylFold
"   Auto-Indentation - https://github.com/vim-scripts/indentpython.vim
"   Tags bar - http://ctags.sourceforge.net/ and https://github.com/majutsushi/tagbar

"   Completion - https://github.com/Valloric/YouCompleteMe

""" GENERAL VIM STUFF

" No vim-vi compatibility
set nocompatible

set smarttab
set ruler

" Set statusline options
set laststatus=2
set statusline+=%f\ %l:\ %c

" Enables filetype detection
filetype plugin indent on

" I don't like swap files
set noswapfile

" Show the command I'm typing in the bottom right
set showcmd

" Display line numbers
set nu

" Make space my leader key
nnoremap <Space> <Nop>
let mapleader =" "

" Use :sp <filename> split vertically to the right
" Use :vs <filename> split horizontally to the bottom
set splitbelow
set splitright

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Print position
map <C-G> g<C-G>

" make backspaces more powerfull
set backspace=indent,eol,start

" Set files formats as unix and some tab config
set expandtab
"set autoindent
set fileformat=unix
set tabstop=2
set softtabstop=2
set shiftwidth=2

" UTF8 Support
set encoding=utf-8

syntax on

set matchpairs+=<:>

""" PLUGIN CONFIGS

" ZENBURN/SOLARIZED OPTIONS
" Maybe we need to enable 256color in our profile or bash_profile
" if this doesn't work by default 'export TERM=xterm-256color'
" :so $VIMRUNTIME/syntax/hitest.vim shows you all the
" current highlighting group colors

"Fix for SignColumn colorscheme https://github.com/airblade/vim-gitgutter/issues/696
au ColorScheme * highlight! link SignColumn LineNr

"set t_Co=256
"colors zenburn
set background=dark
"fix for iterm transparency
let g:solarized_termtrans = 1
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 16
colors solarized


" SIMPYLFOLD OPTIONS
let g:SimpylFold_docstring_preview = 1
" Enable toggling folds with <leader>,
nnoremap <leader>, zA


" SYNTASTIC OPTIONS
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["python"] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_python_flake8_post_args="--max-line-length=120"
let g:syntastic_python_flake8_quiet_messages = {
        \ "regex" : ['E266','E402'] }
" manually perform syntax check (the file must be saved in order to check)
nmap <silent> <leader>c :w<cr>:SyntasticCheck<cr>
" remove all error symbols in the signs column
nmap <silent> <leader>C :SyntasticReset<cr>


" NERDTREE AND NERDTREE-TAB OPTIONS
" Hide .pyc files in nerdtree
"let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" Toggle NERDTree with leader(space)+n
"map <leader>n :NERDTreeTabsToggle<CR>
" Find currently opened file and select it
"map <leader>f :NERDTreeFind<CR>


" CTRL-P OPTIONS
"Default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"Set local working directory
"r - nearest ancestor of the current file that contains one of these
"directories or files: .git .hg .svn .bzr _darcs
"a - the directory of the current file, unless it is a subdirectory of the
"cwd
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
     \ 'dir':  '\v[\/]\.(git|hg|svn)$',
     \ 'file': '\v\.(pyc)$',
     \ }


" TAG-BAR OPTIONS
nmap <F8> :TagbarToggle<CR><C-L>

" VIM-COMMENTARY OPTIONS
autocmd FileType *.sls setlocal commentstring=#\ %s

" VIM-GITGUTTER OPTIONS
nmap <leader>g :GitGutterToggle<CR>

""" PYTHON RELATED CONFIGS

"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Flag unnecesary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.yml,*.sls match BadWhitespace /\s\+$/

" Proper PEP8 identation and line length
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=120

" Folding methods and classes based on indentation
autocmd FileType python set foldmethod=indent

" Pretty syntax
let python_highlight_all=1

""" ANSIBLE RELATED CONFIGS

au BufNewFile,BufRead *.yml set filetype=ansible

let g:ansible_attribute_highlight = "ab"
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1

" Identation for md and yml files (ansible playbooks and roles)
" also for saltstack and similar files
au BufNewFile,BufRead *.yaml,*.yml,*.md,*.sls set tabstop=2
au BufNewFile,BufRead *.yaml,*.yml,*.md,*.sls set softtabstop=2
au BufNewFile,BufRead *.yaml,*.yml,*.md,*.sls set shiftwidth=2
au BufNewFile,BufRead *.yaml,*.yml,*.md,*.sls set expandtab
au BufNewFile,BufRead *.yaml,*.yml setlocal commentstring=#\ %s

""" OTHER CONFIGS
" Add the following to ~/.inputrc will set all the shell to VIM mode
" including python interpreters, and stuff.
"
" set editing-mode vi

" Disable arrow keys and esc
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
