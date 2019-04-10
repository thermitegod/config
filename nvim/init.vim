"plugins
call plug#begin('/home/brandon/.config/nvim/plugged')

"git browser
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

"vim-script library
Plug 'https://github.com/vim-scripts/L9'

"file system explorer
Plug 'https://github.com/scrooloose/nerdtree'

"code completion
"Plug 'https://github.com/Valloric/YouCompleteMe', { 'do': './install.py' }

"status line
Plug 'https://github.com/vim-airline/vim-airline'

"tmux integration
Plug 'https://github.com/christoomey/vim-tmux-navigator'

"nested parens will be given different colors
Plug 'https://github.com/kien/rainbow_parentheses.vim'

"mass un/commenting
Plug 'https://github.com/tpope/vim-commentary'

"auto adds matching parens and square brackets etc
Plug 'https://github.com/jiangmiao/auto-pairs'

"change tags to other tag types, comps above
Plug 'https://github.com/kris2k/vim-surround'

"display whitespace
Plug 'https://github.com/ntpeters/vim-better-whitespace'

"text align
Plug 'https://github.com/godlygeek/tabular'

"syntax checking: incompat w/ ale
Plug 'https://github.com/scrooloose/syntastic'

"async syntax checking: incompat w/ syntastic -- breaks on #include, unusable
"Plug 'https://github.com/w0rp/ale'

"running multiple process asynchronously base on neomake
Plug 'https://github.com/tracyone/neomake-multiprocess'

"code formating
Plug 'https://github.com/Chiel92/vim-autoformat'

call plug#end()

let mapleader = ","
let g:mapleader = ","

"fast saving
nmap <leader>w :w!<cr>

"set default encoding
set encoding=utf8

"fix mouse on >=0.2
set mouse=a

"fix insert mode cursor in >=terminator-1.91
set guicursor=

"swap ; :
nnoremap ; :
nnoremap : ;

"dont act as vi
set nocompatible

"nano like exit, only keeping for memories
"map <C-x> :wq!<cr>

"general
set number
set lazyredraw

"history to remember
set history=1000

"update if file changed
set autoread
set nomodeline

"use sudo to save
command W w !sudo tee % > /dev/null

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

"tabs
set noexpandtab
"set smarttab
set shiftwidth=8
set tabstop=8

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

"run emerge *.ebuild digest
"WIP
"autocmd BufWritePost *.ebuild

"show over 80 col
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)

"reload nvim on config change
"augroup ReloadInitVim
"    autocmd!
"    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
"augroup END

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

" NERDTree start
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"vim airline settings
"let g:airline#extensions#tabline#enabled = 1
"rainbow parens set to always be on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"autoformat
"let g:formatterpath = ['/usr/bin/astyle']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

"autocmd FileType c,cpp setlocal equalprg=clang-format

"ALE
"err on status line
"let g:airline#extensions#ale#enabled = 1
"let g:ale_c_gcc_autoinclude_source_dir = 1
"let g:ale_c_clang_autoinclude_source_dir = 1
" Enable completion where available.
"let g:ale_completion_enabled = 1

