"plugins
call plug#begin('/home/brandon/.config/nvim/plugged')

"status line
Plug 'https://github.com/vim-airline/vim-airline'

"nested parens will be given different colors
Plug 'https://github.com/kien/rainbow_parentheses.vim'

"auto adds matching parens and square brackets etc
Plug 'https://github.com/jiangmiao/auto-pairs'

call plug#end()

let mapleader = ","
let g:mapleader = ","

"set default encoding
set encoding=utf8

"fix mouse on >=0.2
set mouse=a

"fix insert mode cursor
set guicursor=

"swap ; :
nnoremap ; :
nnoremap : ;

"dont act as vi
set nocompatible

"general
set number
set lazyredraw

"history to remember
set history=1000

"update if file changed
set autoread
set nomodeline

"show all maching in :find with tab comp
set wildmenu

"current position
set ruler
set cmdheight=2

"search stuff
set ignorecase
set smartcase
set hlsearch
set incsearch

"regular expressions
set magic

"show matching {}
set showmatch

"syntax highlighting
syntax enable

"COLOR SCHEME
"colo monokai-phoenix
colo default-mod

"file type
set fileformats=unix

"spaces
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

"auto indent
set ai

"smart indent
set si

"wrap lines
set wrap

"remember info about open buffers on close
set viminfo^=%

"always show status line
set laststatus=2

"status kline format
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"del trailing whitespace
"note: will change last edit location to
"where last tailing white space was removed from
fun! <SID>deltailwhite()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>deltailwhite()

"toggle spell checking
map <leader>ss :setlocal spell!<cr>

"backup
set nobackup
set nowb
set noswapfile

"vim airline settings
"let g:airline#extensions#tabline#enabled = 1
"rainbow parens set to always be on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

