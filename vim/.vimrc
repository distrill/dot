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

" " lint
Plugin 'w0rp/ale'

" pretty line
Plugin 'itchyny/lightline.vim'

" comments hotkey
Plugin 'tomtom/tcomment_vim'

" git status in file gutter
Plugin 'airblade/vim-gitgutter'

" search file contents
Plugin 'mileszs/ack.vim'

"colors theme
Plugin 'ayu-theme/ayu-vim'
Plugin 'larsbs/vimterial_dark'
Plugin 'dsolstad/vim-wombat256i'

" rust as
Plugin 'rust-lang/rust.vim'

" preview colors in css
Plugin 'ap/vim-css-color'

" fugitive, git plugin
Plugin 'tpope/vim-fugitive'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" user config

" make backspace work like in most other programs
set backspace=indent,eol,start

" colors
syntax on
set termguicolors
let ayucolor="mirage"
colorscheme ayu

" all the mouse support
set mouse=a

" line numbers
set number

" NERDTree et all
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeNodeDelimiter = "\u00a0"
map <c-m> :NERDTreeFocus <CR>
map <C-n> :NERDTreeToggle<CR>
map <c-k> :NERDTreeFind <CR>


" tabs/spaces by filetype
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype sass setlocal ts=2 sw=2 sts=0 expandtab

" fuzzy file search
map ; :Files<CR>
map <c-p> :Buffers <CR>
:let $FZF_DEFAULT_COMMAND  = 'find . -type f ! -path "*/node_modules/*" -type f ! -path "*/.git/*" -type f ! -path "*/.pg_data/*"'

" Fix files with prettier, and then ESLint.
let b:ale_fixers = {'javascript': ['prettier', 'eslint'], 'rust': ['rustfmt']}
let g:ale_javascript_prettier_options = '--trailing-comma es5 --single-quote true --print-width 100'
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:rustfmt_autosave = 1

if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2

" toggle highlight search 
map <c-h> :set hlsearch! <CR>

" shut up stupid bell
set belloff=all

" no word wrap pls
set nowrap

" search for visually selected text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>``

" splits
nmap :vs :vsplit
nmap :hs :split
set splitbelow
set splitright

" yank to clipboard
vmap <c-y> “+y

" fuck you swap files
set noswapfile

" allow h and l to wrap previous and next lines
set whichwrap+=<,>,h,l,[,]

" yank to clipboard
vmap <c-y> "+y

" write good
set spelllang=en
set spell
set spellcapcheck=$a
