set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'ervandew/supertab'
Plug 'terryma/vim-multiple-cursors'
Plug 'derekwyatt/vim-scala'
"Plug 'Lokaltog/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'ap/vim-css-color'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'blueyed/smarty.vim', { 'for': 'smarty' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim'
Plug 'https://github.com/tmux-plugins/vim-tmux.git'

" Add plugins to &runtimepath
call plug#end()

set number
syntax enable
set background=dark
let g:solarized_termcolors = 256
let base16colorspace=256
colorscheme base16-eighties

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set to auto read when a file is changed from the outside
set autoread
" Set to write when focus is lost
set autowriteall

" Turn off backups
set nobackup
set nowb
set noswapfile

filetype plugin indent on

" Map leader key
let mapleader = " "

" Vim-Sneak config
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1

" Make delimitMate stop expanding < into <>
let delimitMate_matchpairs = "(:),[:],{:}"

" Vim explorer mode shortcut and nerdtree-like display
let g:netrw_liststyle=3
map <C-e> ;Explore<cr>

set virtualedit=onemore

" Remap colon to semicolon cuz lazy
nnoremap ; :

" Tab and indent stuff
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set copyindent
set preserveindent
set autoindent

set listchars=tab:\|-,nbsp:_,trail:.

" Using 4 spaces by default
autocmd Filetype * setlocal sts=4 expandtab
" Using hard tabs for javascript, css
autocmd Filetype javascript setlocal sts=0 noexpandtab
autocmd Filetype css setlocal sts=0 noexpandtab
" Template file syntax highlighting
au BufRead,BufNewFile *.tmpl set filetype=smarty

" Search stuff
set incsearch
set hlsearch
set ignorecase
set smartcase

" Scrolling stuff
set scrolljump=5
set scrolloff=3

" Status line stuff
set laststatus=2
set statusline=%f
set statusline+=%{fugitive#statusline()}
" More status line(airline) stuff
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#show_message = 0
" Remove encoding
let g:airline_section_y = ''
" Remove percentage/line#/col#
let g:airline_section_z = ''
" Better usage of tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Reload vimrc on update
augroup reload_vimrc " {
        autocmd!
            autocmd BufWritePost $MYVIMRC source $MYVIMRC
        augroup END " }"

" Highlight trailing whitespace with error
match ErrorMsg '\s\+$'

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Open help in a vertical split instead of the default horizontal split
" http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev h <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'h')<cr>
cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'help')<cr>

" Split windows below and right instead of above and left
set splitbelow splitright

" Wrap characters on lines that exceed 80 characters in length
set colorcolumn=80

" Allow saving of files as sudo when forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Set color of vertical split border
set fillchars+=vert:\|

" Proper pasting from outside applications
set pastetoggle=<F2>

" FZF stuff
nnoremap <C-t> :Files<cr>
nnoremap <C-p> :GitFiles<cr>
nnoremap <C-g> :Tags<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <C-i> :History<cr>
nnoremap <C-m> :Marks<cr>
nnoremap <C-f> :BTags<cr>

" Close buffers without closing splits
nnoremap <C-c> :bp\|bd #<CR>

" Map jk to exit insert mode
imap jk <Esc>

" Perf stuff
set lazyredraw
set ttyfast

let g:tmux_navigator_save_on_switch = 1
