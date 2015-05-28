set nocompatible

" Plugins
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
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'ap/vim-css-color'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()

set number
syntax enable
set background=dark
let g:solarized_termcolors = 256
colorscheme kolor

filetype plugin indent on

" Map leader key
let mapleader = ","

" Ctrl-P plugin commands
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Vim explorer mode shortcut and nerdtree-like display
let g:netrw_liststyle=3
map <C-e> ;Explore<cr>

set listchars=tab:>~,nbsp:_,trail:.
set virtualedit=onemore

" Remap colon to semicolon cuz lazy
nnoremap ; :
nnoremap : ;

" Tab and indent stuff
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

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

" Enable indent guides by default
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" Open help in a vertical split instead of the default horizontal split
" http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev h <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'h')<cr>
cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'help')<cr>

" Split windows below and right instead of above and left
set splitbelow splitright

" Wrap characters on lines that exceed 80 characters in length
set colorcolumn=80
