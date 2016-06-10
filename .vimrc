set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/ervandew/supertab.git'
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
Plug 'https://github.com/derekwyatt/vim-scala.git', { 'for': 'scala' }
Plug 'https://github.com/easymotion/vim-easymotion.git'
Plug 'https://github.com/justinmk/vim-sneak.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/bling/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/ap/vim-css-color.git'
Plug 'https://github.com/christoomey/vim-tmux-navigator.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/chriskempson/base16-vim.git'
Plug 'https://github.com/blueyed/smarty.vim.git', { 'for': 'smarty' }
Plug 'https://github.com/junegunn/fzf.git', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/Raimondi/delimitMate.git'
Plug 'https://github.com/Shougo/deoplete.nvim.git'
Plug 'https://github.com/tmux-plugins/vim-tmux.git'
Plug 'https://github.com/othree/javascript-libraries-syntax.vim.git'
Plug 'https://github.com/mxw/vim-jsx.git', { 'for': 'jsx' }
Plug 'https://github.com/othree/csscomplete.vim.git', { 'for': 'css' }
Plug 'https://github.com/othree/yajs.vim.git', { 'for': 'javascript' }
Plug 'https://github.com/benekastah/neomake.git'
Plug 'https://github.com/othree/html5.vim.git'
Plug 'https://github.com/mattn/emmet-vim.git', { 'for': 'smarty.html' }
Plug 'https://github.com/StanAngeloff/php.vim.git', { 'for': 'php' }
Plug 'https://github.com/ternjs/tern_for_vim.git', { 'dir': '~/.vim/plugged/tern_for_vim', 'do': 'npm install', 'for': 'javascript' }
Plug 'https://github.com/carlitux/deoplete-ternjs.git', { 'for': 'javascript' }
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/joshdick/airline-onedark.vim.git'
Plug 'https://github.com/mhinz/vim-startify.git'
Plug 'https://github.com/joonty/vdebug.git'
Plug 'https://github.com/mhartington/oceanic-next.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/editorconfig/editorconfig-vim.git'
Plug 'https://github.com/mhinz/vim-grepper.git'
Plug 'https://github.com/ddrscott/vim-side-search.git'
Plug 'https://github.com/Shougo/vimfiler.vim.git'
Plug 'https://github.com/Shougo/unite.vim.git'
Plug 'https://github.com/w0ng/vim-hybrid.git'

" Add plugins to &runtimepath
call plug#end()

set number
syntax enable
set background=dark
let g:solarized_termcolors = 256
let base16colorspace=256
let g:onedark_termcolors = 256
colorscheme OceanicNext

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

let g:jsx_ext_required = 1
let g:used_javascript_libs = 'react'

" Vim explorer mode shortcut and nerdtree-like display
let g:netrw_liststyle=3
nnoremap <C-e> :Explore<cr>

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

set list
set showbreak=↪
set listchars=tab:»\ ,nbsp:_,trail:.,eol:¬

" Using 4 spaces by default
autocmd Filetype * setlocal sts=4 expandtab
" Using hard tabs for javascript, css
autocmd Filetype javascript setlocal sts=0 noexpandtab omnifunc=tern#Complete
autocmd Filetype javascript.jsx setlocal sts=0 noexpandtab
autocmd FileType css setlocal sts=0 noexpandtab omnifunc=csscomplete#CompleteCSS noci
" Template file syntax highlighting
autocmd BufRead,BufNewFile *.tmpl set filetype=smarty.html

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
let g:airline_theme = 'oceanicnext'
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

" Mapping to copy to system clipboard
vnoremap <C-y> "+y

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

" Grepper Aliases
cabbrev ag Grepper! -tool ag -open -switch

" Close buffers without closing splits
nnoremap <C-c> :bp\|bd #<CR>

" Map jk to exit insert mode
inoremap jk <Esc>

" Perf stuff
set lazyredraw
set ttyfast

let g:tmux_navigator_save_on_switch = 1

" Create splits using C+w+- and C+w+|
map <silent> <C-w>- :sp<CR>
map <silent> <C-w>\| :vsp<CR>

" Resizing windows
map <silent> <C-w>k :res +5<CR>
map <silent> <C-w>j :res -5<CR>
map <silent> <C-w>h :vertical resize -5<CR>
map <silent> <C-w>l :vertical resize +5<CR>

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_maker = {
    \ 'exe': $PWD .'/node_modules/bin/eslint.js',
    \ 'args': ['-f', 'compact', '--rulesdir=tools/js/eslint-rules'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }
let g:neomake_jsx_eslint_maker = {
    \ 'exe': $PWD .'/node_modules/bin/eslint.js',
    \ 'args': ['-f', 'compact', '--rulesdir=tools/js/eslint-rules'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }

" Default selection order starts from the bottom of the completion list,
" which is almost always too specific. Reverse it so that selection
" goes from general->specific
let g:SuperTabDefaultCompletionType = "<c-n>"
