set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'zeis/vim-kolor'
Plugin 'derekwyatt/vim-scala'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'

call vundle#end()

set number
syntax enable
set background=dark
let g:solarized_termcolors = 256
colorscheme kolor

filetype plugin indent on

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:netrw_liststyle=3
map <c-k> ;Explore<cr> 

set listchars=tab:>~,nbsp:_,trail:.
nnoremap ; :
nnoremap : ;

set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set hlsearch
set ignorecase
set smartcase
set term=screen-256color

