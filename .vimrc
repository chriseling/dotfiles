set nocompatible
filetype off

"Plugins
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
Plugin 'tpope/vim-fugitive'

call vundle#end()

set number
syntax enable
set background=dark
let g:solarized_termcolors = 256
colorscheme kolor

filetype plugin indent on

"Ctrl-P plugin commands
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"Vim explorer mode shortcut and nerdtree-like display
let g:netrw_liststyle=3
map <c-k> ;Explore<cr> 

set listchars=tab:>~,nbsp:_,trail:.

"Remap colon to semicolon cuz lazy
nnoremap ; :
nnoremap : ;

"Tab and indent stuff
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

"Search stuff
set hlsearch
set ignorecase
set smartcase

"Make colors correct
set term=screen-256color

"Status line stuff
set laststatus=2
set statusline=%f
set statusline+=%{fugitive#statusline()}

"Reload vimrc on update
augroup reload_vimrc " {
        autocmd!
            autocmd BufWritePost $MYVIMRC source $MYVIMRC
        augroup END " }"
