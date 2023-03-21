"plugins
call plug#begin('/home/brandon/.config/nvim/plugged')

"status line
Plug 'https://github.com/vim-airline/vim-airline'

"nested parens will be given different colors
Plug 'https://github.com/kien/rainbow_parentheses.vim'

"auto adds matching parens and square brackets etc
Plug 'https://github.com/jiangmiao/auto-pairs'

"display whitespace
Plug 'https://github.com/ntpeters/vim-better-whitespace'

call plug#end()

"plugins end

let mapleader = ","
let g:mapleader = ","

"fast saving
nmap <leader>w :w!<cr>

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

"use doas to save
command W w !doas tee % > /dev/null

"serch in subdirs
set path+=**

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

"no sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"syntax highlighting
syntax enable

"COLOR SCHEME
"colo monokai-phoenix
colo default-mod

"file type
set ffs=unix,dos,mac

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

"fix the delay when switching insert-->normal
set timeoutlen=1000 ttimeoutlen=0

"mappings for tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

"return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"remember info about open buffers on close
set viminfo^=%

"always show status line
set laststatus=2

"status kline format
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"yml file formating
au BufNewFile,BufRead *.yaml,*.yml set et ts=2 sw=2

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

" wildmenu ignore compiled
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

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

