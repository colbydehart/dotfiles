"==============================================================================
"================================COLBY=DEHART'S================================
"==================================WONDERFUL===================================
"===================================HORRIBLE===================================
"====================================VIMRC=====================================
"==============================================================================
"===================================GENERAL====================================
set statusline=[%l,%v]\ %f%m%r%h%w\ %y[%p%%]\ %{fugitive#statusline()}
set t_Co=256                       "256 colors
set tabstop=2 shiftwidth=2         "2 spaces for tab
set expandtab                      "no tabs
set timeoutlen=1000 ttimeoutlen=-1 "better timeouts"
set ruler                          "show line and column in status line
set number                         "Line numbers
set mouse=a                        "Use the mouse
set backspace=2                    "Useful backspace
set cindent                        "Auto indent
set foldmethod=syntax              "Code folding
set foldlevelstart=5               "Don't fold it all
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
set inccommand=split               "Show substitute preview
set updatetime=2000                "A bit faster updatetime
:let mapleader = ' '               "Leader is space
:let maplocalleader = ','          "LocalLeader is comma
au! QuickFixCmdPost [^l]* cwindow  "open quickfix after search
au! QuickFixCmdPost l* lwindow     "open quickfix after search

"===================================FUNCTIONS===================================

func! StripTrailingWhitespace()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunc
"Clear trailing whitespace
au! BufWritePre * silent call StripTrailingWhitespace()
"For conditionally loading plugs
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

"===================================IGNORE======================================
"
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=.git
set wildignore+=.venv

"===================================PLUGINS=====================================

call plug#begin()

"===================================NAVIGATION==================================

Plug 'justinmk/vim-dirvish'
Plug 'tommcdo/vim-lion'
Plug 'justinmk/vim-sneak'
let g:sneak#label=1
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'

"===================================COSMETIC====================================

Plug 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
Plug 'AndrewRadev/splitjoin.vim'
Plug 'romainl/Apprentice'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'powerman/vim-plugin-AnsiEsc'

"===================================TPOPE======================================

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'

"===================================BUILD/TEST==================================

Plug 'neomake/neomake'
au! BufWritePost,BufRead * Neomake
Plug 'janko-m/vim-test'

"===================================COMPLETION==================================

Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup=1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources = {}
let g:deoplete#omni#patterns = {}
let g:deoplete#auto_complete_delay=50
au! CompleteDone * pclose!
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'
let g:neosnippet#snippets_directory="/Users/colbydehart/dotfiles/snippets"
let g:neosnippet#scope_aliases = {}

"===================================WEB=========================================

Plug 'mattn/emmet-vim'
Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal=0

"===================================JAVASCRIPT==================================

let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_jsx_enabled_makers = ['standard']
let g:neosnippet#scope_aliases['javascript.jsx'] = 'javascript,jsx'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn global add tern'}
let g:tern_request_timeout=1
let g:tern_show_argument_hints="on_hold"
let g:deoplete#sources.javascript = ['ternjs']
let g:deoplete#sources.jsx = ['ternjs']
let g:tern#filetypes = [ 'jsx', 'javascript.jsx' ]

"===================================ELIXIR======================================

Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
augroup elixir
  au!
  au FileType elixir nn <buffer> <localleader>i :IEx<Space>
  au FileType elixir nn <buffer> <localleader>m :Mix<Space>
  au FileType elixir nn <buffer> <localleader>d :ExDoc<Space>
augroup END

"===================================ELM=========================================

Plug 'ElmCast/elm-vim', {'for': 'elm'}
let g:elm_format_autosave=1
augroup elm
  au!
  au FileType elm setlocal tabstop=4
  au FileType elm setlocal shiftwidth=4
  au FileType elm setlocal softtabstop=4
  au bufenter,bufwritepost *.elm :IndentLinesReset
augroup END

"===================================CLOJURE=====================================

Plug 'guns/vim-sexp',
      \ {'for': ['clojure', 'clojurescript']}
Plug 'tpope/vim-sexp-mappings-for-regular-people',
      \ {'for': ['clojure', 'clojurescript']}
Plug 'tpope/vim-fireplace',
      \ {'for': ['clojure', 'clojurescript']}
au! BufEnter build.boot set filetype=clojure
augroup clojure
  au!
  au FileType clojure nn <buffer> <LocalLeader>C
        \ :Piggieback! (figwheel-sidecar.repl-api/repl-env)<CR>
augroup END

"===================================RUBY========================================

Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}

"==================================PYTHON=======================================

augroup python
  au!
  au FileType python setlocal tabstop=4
  au FileType python setlocal shiftwidth=4
  au FileType python setlocal softtabstop=4
  au FileType python nn <localleader>f :0,$!yapf<CR>
augroup END

"===================================VIML========================================

Plug 'shougo/neco-vim'
Plug 'thinca/vim-themis'

"===================================ETC=========================================

Plug 'jceb/vim-orgmode'

"===================================ENDPLUGIN====================================

call plug#end()
filetype plugin indent on
syntax enable

"===================================COLORSCHEME=================================

set background=light
colo apprentice
" For denite sources
hi Search cterm=reverse ctermfg=0 ctermbg=85
hi CursorLine ctermfg=85

"===================================FAST=SEARCH=================================

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  call denite#custom#var('file_rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

"===================================KEYBINDINGS=================================

nn <leader>bb :Denite buffer<CR>
nn <leader>bh :bN<CR>
nn <leader>bl :bn<CR>
nn <leader>d :Dirvish %<CR>
nn <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nn <leader>f :Denite file_rec<CR>
nn <leader>g :Gstatus<CR>
nn <leader>h :h<Space>
nn <leader>k ZZ
nn <leader>m :Denite file_mru<CR>
nn <leader>n :tabe<CR>
nn <leader>o :e ~/Dropbox/org/gtd.org<CR>
nn <leader>q :b#<CR>
nn <leader>rr :Subvert/
nn <leader>ra :%Subvert/
nn <leader>sk :split<CR>
nn <leader>sj :split<CR><C-W>j
nn <leader>sh :vsplit<CR>
nn <leader>sl :vsplit<CR><C-W>l
nn <leader>tt :TestNearest<CR>
nn <leader>tf :TestFile<CR>
nn <leader>ta :TestSuite<CR>
nn <leader>tl :TestLast<CR>
nn <leader>tg :TestVisit<CR>
nn <leader>vv :e ~/dotfiles/.vimrc<CR>
nn <leader>vl :e ./.lvimrc<CR>
nn <leader>w :w<CR>
nn <leader>x :
nn <leader>y :NeoSnippetEdit<CR>
nn <leader>/ :grep!<Space>
nn <leader>` :terminal<CR>
nn <leader>-- :so ./Session.vim<CR>
nn <leader>-m :mks ./Session.vim<CR>
nn <leader><CR> :
" Window navigation
nn <C-j> <C-W>j
nn <C-k> <C-W>k
nn <C-h> <C-W>h
nn <C-l> <C-W>l
" Window resize
nn <Left> :vertical resize +2<CR>
nn <Right> :vertical resize -2<CR>
nn <Up> :resize +2<CR>
nn <Down> :resize -2<CR>
" Tab navigation
nn H gT
nn L gt
" Denite navigation
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
" One button cmds
nn ! :!
" Terminal stuff
:tnoremap <Esc> <C-\><C-n>
" Local Vimrc
if filereadable('./.lvimrc')
  exec 'source ./.lvimrc'
endif
" Autocomplete with tab; Please kill me.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

imap <silent> <expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()

" Autoreload .vimrc
au! bufwritepost .vimrc source %
au! bufwritepost .lvimrc source %

