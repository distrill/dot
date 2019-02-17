set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" autocomplete
Plugin 'Valloric/YouCompleteMe'

" nerd tree
Plugin 'scrooloose/nerdtree'

" nerd tree git status
Plugin 'Xuyuanp/nerdtree-git-plugin'

" fuzzy find
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

" lint
Plugin 'w0rp/ale'

" pretty line
Plugin 'itchyny/lightline.vim'

" comments hotkey
Plugin 'tomtom/tcomment_vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" make backspace work like in most other programs
set backspace=indent,eol,start

" colors
syntax on
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

" mouse
set mouse=a

" line numbers
set number

" close vim if only window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" focus to file when opened in new tab
nmap <c-n> :NERDTreeToggle<CR>


" tabs/spaces by filetype
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

" fuzzy file search
map ; :Files<CR>

" Fix files with prettier, and then ESLint.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}


if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2

" toggle highlight search 
map <c-h> :set hlsearch!
