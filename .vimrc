"====================GENERAL====================== 
"=================================================
set t_Co=256
set tabstop=2 shiftwidth=2
set ruler                       "show line and column in status line
set number                      "Line numbers
set mouse=a                     "Use the mouse
set backspace=2                 "Useful backspace
set cindent                     "Auto indent
set ls=2                        "Better status line
set clipboard=unnamed           "Use system clipboard
set nobackup                    "No backups!
set visualbell                  "No sounds!
set nohlsearch   								"No highlight search
set noswapfile                  "No swaps!
set wildmenu                    "Tab autocomplete commands
:let mapleader = " "            "Leader is space
" Conditional stuff
if $USE_TABS == '1' 
  set expandtab
endif
if $USE_FINAL_NEWLINE != '1'
  set noeol
endif

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
"=================================================
" Ignore
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=.git
set wildignore+=.venv
"==================================
" Plugins
call plug#begin()
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-speeddating'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-commentary'
" Plug 'junegunn/vim-easy-align'
" Plug 'Raimondi/delimitMate'
Plug 'tstelzer/welpe.vim'
" Plug 'airblade/vim-gitgutter'
" Plug 'luochen1990/rainbow'
" Plug 'vim-orgmode'
" let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'ajh17/VimCompletesMe'
" " Plug 'scrooloose/syntastic'
set splitbelow
" Javascript
" Plug 'ternjs/tern_for_vim', {'do': 'npm i'}
" Plug 'mxw/vim-jsx'
" let g:jsx_ext_required = 0
" let g:syntastic_javascript_checkers = ['eslint']
" Elixir
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
" Clojure
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
" Ruby
Plug 'tpope/vim-rails', {'for': 'ruby'}
call plug#end()
filetype plugin indent on
syntax on

"=================================================
" Keybindings

" Leader bindings
nn <leader>b :CtrlPBuffer<CR>
nn <leader>f :CtrlP<CR>
nn <leader>g :Magit<CR>
nn <leader>k ZZ
nn <leader>n :tabe<CR>
nn <leader>oo :e ~/Dropbox/org/gtd.org<CR>
nn <leader>sk :split<CR>
nn <leader>sj :split<CR><C-W>j
nn <leader>sh :vsplit<CR>
nn <leader>sl :vsplit<CR><C-W>l
nn <leader>v :e ~/.vimrc<CR>
nn <leader>w :w!<CR>
nn <leader>x :Explore<CR>

" Window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Tab navigation
nn H gT
nn L gt
" Easier autocomplete
ino <C-E> <C-X><C-O>
" Local Vimrc
if filereadable("./.lvimrc")
    execute "source ./.lvimrc"
endif

colo welpe

autocmd! bufwritepost .vimrc source %
