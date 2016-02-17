     "Spaces, no tabs
set backspace=2                 "Make backspacing work in insert
set tabstop=2                   "2 spaces per tab
set shiftwidth=2                "2 spaces for autoindent
set autoindent                  "Set new line to previous line indent
set autoread                    "Update files on change
set smartindent                 "Automatically indent
set nobackup                    "No backups!
set visualbell                  "No sounds!
set noswapfile                  "No swaps!
set wildmenu                    "Tab autocomplete commands
:let mapleader = " "            "Leader is space

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
"=================================================
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=.git
set wildignore+=.venv
"=================================================
" Keybindings
nn <leader>w :w!<CR>
nn <leader>ft :vs<CR>:Ex<CR>iiii
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nn H gT
nn L gt

"Local Vimrc
if filereadable("./.lvimrc")
    execute "source ./.lvimrc"
endif

autocmd! bufwritepost .vimrc source %
