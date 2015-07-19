set nocompatible

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'zeis/vim-kolor'
Plugin 'derekwyatt/vim-scala'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'ap/vim-css-color'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'rking/ag.vim'

call vundle#end()

set number
syntax enable
set background=dark
let g:solarized_termcolors = 256
colorscheme kolor

filetype plugin indent on

" Map leader key
let mapleader = ","

" Vim-Sneak config
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1

" Ctrl-P plugin commands
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/generated/*,*/img/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 0
let g:ctrlp_max_height = 20
let g:ctrlp_match_window = 'results:30'
let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
let g:ctrlp_by_filename = 1

" Vim explorer mode shortcut and nerdtree-like display
let g:netrw_liststyle=3
map <C-e> ;Explore<cr>

set list
set listchars=tab:>~,nbsp:_,trail:.
set virtualedit=onemore

" Remap colon to semicolon cuz lazy
nnoremap ; :

" Tab and indent stuff
set backspace=indent,eol,start
set tabstop=4
set softtabstop=0
set shiftwidth=4
set noexpandtab
set copyindent
set preserveindent

" Search stuff
set incsearch
set hlsearch
set ignorecase
set smartcase

" Scrolling stuff
set scrolljump=5
set scrolloff=3

" Make colors correct
set term=screen-256color

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
let g:airline_symbols.whitespace = 'Ξ'

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
