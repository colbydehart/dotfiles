"====================GENERAL======================
"=================================================
set t_Co=256
set tabstop=2 shiftwidth=2
set expandtab                      "no tabs
set timeoutlen=1000 ttimeoutlen=-1 "better timeouts"
set ruler                          "show line and column in status line
set number                         "Line numbers
set mouse=a                        "Use the mouse
set backspace=2                    "Useful backspace
set cindent                        "Auto indent
set foldmethod=syntax              "Code folding
set foldlevelstart=4               "Don't fold it all
set ls=2                           "Better status line
set clipboard=unnamed              "Use system clipboard
let g:netrw_localrmdir='rm -r'     "Recursive delete in netrw
set nobackup                       "No backups!
set visualbell                     "No sounds!
set nohlsearch   							     "No highlight search
set wildignorecase                 "Case insensitive file search
set noswapfile                     "No swaps!
set wildmenu                       "Tab autocomplete commands
set diffopt=vertical               "Vertical diff splits
:let mapleader = ' '               "Leader is space
:let maplocalleader = ','          "LocalLeader is comma

"====================FUNCTIONS======================

func! StripTrailingWhitespace()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunc
"Clear trailing whitespace
au! BufWritePre * silent call StripTrailingWhitespace()

"====================IGNORE======================
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=.git
set wildignore+=.venv
"====================PLUGINS======================
call plug#begin()
" Navigation
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping=0
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
" " Cosmetic
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
let g:airline_left_sep= '░'
let g:airline_right_sep= '░'
let g:airline_powerline_fonts = 1
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'powerman/vim-plugin-AnsiEsc'
" The holiest of holies, the Pope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
" Build/Test/Lint
Plug 'neomake/neomake'
au! BufWritePost * Neomake
Plug 'janko-m/vim-test'
" Completion
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni#functions = {}
au! CompleteDone * pclose!
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'
let g:neosnippet#snippets_directory="/Users/colbydehart/dotfiles/snippets"
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabClosePreviewOnPopupClose = 1
imap <C-e> <Plug>(neosnippet_expand_or_jump)
" imap <expr> <TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
" imap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" imap <expr> <CR> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
" Web
Plug 'mattn/emmet-vim'
imap <C-y><C-y> <C-y>,
Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal=0
" Javascript
Plug 'ternjs/tern_for_vim', {'do': 'npm i', 'for': ['javascript', 'javascript.jsx']}
Plug 'carlitux/deoplete-ternjs', {'for': ['javascript', 'javascript.jsx']}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:deoplete#omni#functions.javascript = [ 'tern#Complete' ]
let g:deoplete#omni#functions.jsx = [ 'tern#Complete' ]
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:jsx_ext_required = 0
let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_jsx_enabled_makers = ['standard']
" Elixir
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
" Elm
Plug 'ElmCast/elm-vim', {'for': 'elm'}
let g:elm_format_autosave = 1
augroup elm
  au!
  au FileType elm setlocal tabstop=4
  au FileType elm setlocal shiftwidth=4
  au FileType elm setlocal softtabstop=4
  au bufenter,bufwritepost *.elm :IndentLinesReset
augroup END
" Clojure
Plug 'guns/vim-sexp', {'for': ['clojure', 'clojurescript']}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': ['clojure', 'clojurescript']}
Plug 'tpope/vim-fireplace', {'for': ['clojure', 'clojurescript']}
au! BufEnter build.boot set filetype=clojure
augroup clojure
  au!
  au FileType clojure nn <buffer> <LocalLeader>C :Piggieback (figwheel-sidecar.repl-api/repl-env)
augroup END
" Ruby
Plug 'tpope/vim-rails', {'for': 'ruby'}
" Vim
Plug 'shougo/neco-vim'
" Etc
Plug 'jceb/vim-orgmode'
" Post plugin setup
call plug#end()
filetype plugin indent on
syntax enable

set background=dark
colo gruvbox
" silver searcher setup
if executable('ag')
  call denite#custom#var('file_rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
  let g:ackprg = 'ag --nogroup --nocolor --vimgrep'
endif
" For Denite highlighting
hi Search cterm=reverse ctermfg=0 ctermbg=85
hi CursorLine ctermfg=85
"====================KEYBINDINGS======================
" Leader bindings
map <leader><leader> <Plug>(easymotion-overwin-f)
map  / <Plug>(easymotion-sn)
om / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nn <leader>bb :Denite buffer file_mru<CR>
nn <leader>bh :bN<CR>
nn <leader>bl :bn<CR>
nn <leader>d :Explore<CR>
nn <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nn <leader>f :Denite file_rec<CR>
nn <leader>g :Gstatus<CR>
nn <leader>h :Denite help<CR>
nn <leader>k ZZ
nn <leader>n :tabe<CR>
nn <leader>o :e ~/Dropbox/org/gtd.org<CR>
nn <leader>sk :split<CR>
nn <leader>sj :split<CR><C-W>j
nn <leader>sh :vsplit<CR>
nn <leader>sl :vsplit<CR><C-W>l
nn <leader>tt :TestNearest<CR>
nn <leader>tf :TestFile<CR>
nn <leader>ta :TestSuite<CR>
nn <leader>tl :TestLast<CR>
nn <leader>tg :TestVisit<CR>
nn <leader>uj <C-W>-
nn <leader>uk <C-W>+
nn <leader>ul <C-W>>
nn <leader>uh <C-W><
nn <leader>vv :e ~/.vimrc<CR>
nn <leader>vl :e ./.lvimrc<CR>
nn <leader>w :w!<CR>
nn <leader>x :Denite command<CR>
nn <leader>/ :Ack!<Space>
nn <leader>` :terminal<CR>
nn <leader><CR> :
" Denite source navigation
call denite#custom#map('insert', '<C-n>', 'move_to_next_line')
call denite#custom#map('insert', '<C-p>', 'move_to_prev_line')
" Window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Tab navigation
nn H gT
nn L gt
" Align stuff
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" One button cmds
nn ! :!
" Terminal stuff
:tnoremap <Esc> <C-\><C-n>
" Local Vimrc
if filereadable("./.lvimrc")
    execute "source .lvimrc"
endif

" Autoreload .vimrc
au! bufwritepost .vimrc source %
au! bufwritepost .lvimrc source %
