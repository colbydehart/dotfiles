"==============================================================================
"================================COLBY=DEHART'S================================
"==================================WONDERFUL===================================
"===================================HORRIBLE===================================
"====================================VIMRC=====================================
"==============================================================================
"===================================GENERAL====================================
set statusline=[%l,%v]\ %t%m%r%h%w\ %y[%p%%]\ %{fugitive#statusline()}
set statusline+=\ %{ALEGetStatusLine()}
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set t_Co=256                       "256 colors
set termguicolors                  "true color
set tabstop=2                      "2 spaces for tab
set shiftwidth=2                   "2 spaces for tab
set softtabstop=2                  "2 spaces for tab
set expandtab                      "no tabs
set list                           "show tab characters
set timeoutlen=1000 ttimeoutlen=-1 "better timeouts"
set ruler                          "show line and column in status line
set number                         "line numbers
set mouse=a                        "use the mouse
set backspace=2                    "useful backspace
set cindent                        "auto indent
set foldmethod=syntax              "code folding
set foldlevelstart=7               "don't fold it all
set textwidth=80                   "format at 80 lines
set ls=2                           "better status line
set clipboard=unnamedplus          "use system clipboard
let g:netrw_localrmdir='rm -r'     "recursive delete in netrw
set nobackup                       "no backups!
set visualbell                     "no sounds!
set nohlsearch                     "no highlight search after
set incsearch                      "do highlight search during
set ignorecase                     "ignore case when searching
set smartcase                      "don't ignore when i specify
set wildignorecase                 "case insensitive file search
set noswapfile                     "no swaps!
set wildmenu                       "tab autocomplete commands
set diffopt=vertical               "vertical diff splits
set inccommand=split               "show substitute preview
set updatetime=2000                "a bit faster updatetime
:let mapleader = ' '               "leader is space
:let maplocalleader = ','          "localleader is comma
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
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase=1
let g:EasyMotion_keys = 'arstdhneioqwfpgjluy;zxcvbkm,./' "Colemak
let g:EasyMotion_do_mapping=0
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"===================================COSMETIC====================================

Plug 'AlessandroYorba/Sierra'
Plug 'NLKNguyen/papercolor-theme'
Plug 'pbrisbin/vim-colors-off'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'roman/golden-ratio'

"===================================TPOPE======================================

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'

"===================================BUILD/TEST==================================

Plug 'w0rp/ale'
let g:ale_linters = {
      \ 'javascript': ['standard'],
      \ 'jsx': ['standard'],
      \ 'elixir': ['credo']
      \ }
Plug 'janko-m/vim-test'
let g:test#strategy = 'neovim'

"===================================COMPLETION==================================

Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup=1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#functions = {}
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/echodoc.vim'
au! InsertLeave * pclose!
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'
let g:neosnippet#snippets_directory="/Users/colbydehart/dotfiles/snippets"
let g:neosnippet#scope_aliases = {}

"===================================WEB=========================================

Plug 'mattn/emmet-vim'
let g:user_emmet_settings = {
\  'javascript.jsx' : { 'extends' : 'jsx' },
\ }
Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal=0

"===================================JAVASCRIPT==================================

let g:neosnippet#scope_aliases['javascript.jsx'] = 'javascript,jsx'
Plug 'pangloss/vim-javascript', { 'for': [ 'javascript.jsx', 'javascript' ] }
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript.jsx']}
let g:jsx_ext_required = 0  "Always use jsx syntax
let flowreadable = filereadable('./.flowconfig')
Plug 'flowtype/vim-flow', Cond(flowreadable, {'for': ['jsx', 'javascript.jsx']})
if flowreadable
  let g:ale_linters['javascript'] += ['flow']
  let g:ale_linters['jsx'] += ['flow']
  let g:flow#enable=0
  let g:flow#autoclose = 1
endif
" Only use tern if we are not using flow
let ternreadable = filereadable('./.tern-project')
Plug 'carlitux/deoplete-ternjs', Cond(ternreadable, {
      \ 'do': 'yarn global add tern',
      \ 'for': ['jsx', 'javascript', 'javascript.jsx']
      \ })
if ternreadable
  let g:tern_request_timeout=1  "Use tern completion
  let g:tern_show_argument_hints="on_hold"  "Give me argument hints
  let g:tern#filetypes = [ 'javascript', 'jsx', 'javascript.jsx' ]
endif

"===================================ELIXIR======================================

Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'c-brenn/phoenix.vim', {'for': 'elixir'}
Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
augroup elixir
  au!
  au FileType elixir nn <buffer> <localleader>a :A<CR>
  au FileType elixir nn <buffer> <localleader>d :ExDoc<Space>
  au FileType elixir nn <buffer> <localleader>gc :Econtroller<Space>
  au FileType elixir nn <buffer> <localleader>gf :Econfig<Space>
  au FileType elixir nn <buffer> <localleader>gm :Emodel<Space>
  au FileType elixir nn <buffer> <localleader>gt :Etest<Space>
  au FileType elixir nn <buffer> <localleader>gr :Erouter<Space>
  au FileType elixir nn <buffer> <localleader>gv :Eview<Space>
  au FileType elixir nn <buffer> <localleader>gx :Echannel<Space>
  au FileType elixir nn <buffer> <localleader>i :IEx<CR>
  au FileType elixir nn <buffer> <localleader>pg :Pgenerate<Space>
  au FileType elixir nn <buffer> <localleader>pp :Ppreview<Space>
  au FileType elixir nn <buffer> <localleader>ps :Pgenerate<Space>
  au FileType elixir nn <buffer> <localleader>x :Mix<Space>
augroup END

"===================================ELM=========================================

let g:deoplete#omni#input_patterns.elm = '[^ \t]+'
let g:deoplete#omni#functions.elm = ['elm#Complete']
Plug 'ElmCast/elm-vim', {'for': 'elm'}
let g:elm_setup_keybindings=0
let g:elm_format_autosave=1
augroup elm
  au!
  au FileType elm setlocal tabstop=4
  au FileType elm setlocal shiftwidth=4
  au FileType elm setlocal softtabstop=4
  au FileType elm let b:deoplete_sources = ['omni', 'file']
  au bufenter,bufwritepost *.elm :IndentLinesReset
  au FileType elm nn <buffer> K :ElmShowDocs<CR>
  au FileType elm nn <buffer> <localleader>m :ElmMake<CR>
  au FileType elm nn <buffer> <localleader>r :ElmRepl<CR>
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

Plug 'zchee/deoplete-jedi'
augroup python
  au!
  au FileType python setlocal tabstop=4
  au FileType python setlocal shiftwidth=4
  au FileType python setlocal softtabstop=4
  au FileType python nn <localleader>f :0,$!yapf<CR>
augroup END

"=====================================C=========================================

Plug 'zchee/deoplete-clang'
au! FileType arduino setlocal omnifunc=ccomplete#Complete

"===================================VIML========================================

Plug 'shougo/neco-vim'
Plug 'thinca/vim-themis'

"===================================ETC=========================================

" nvalt
Plug 'jceb/vim-orgmode'
Plug 'dag/vim-fish'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'kchmck/vim-coffee-script'

"===================================ENDPLUGIN====================================

call plug#end()
colo sierra
set background=dark
filetype plugin indent on
syntax enable

"===================================FAST=SEARCH=================================

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"===================================KEYBINDINGS=================================
map <leader><leader> <Plug>(easymotion-overwin-f)
map  / <Plug>(easymotion-sn)
om / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nn <leader>bb :Buffers<CR>
nn <leader>bh :bN<CR>
nn <leader>bl :bn<CR>
nn <leader>d :Dirvish %<CR>
nn <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nn <leader>f :GFiles<CR>
nn <leader>g :Gstatus<CR>
nn <leader>h :h<Space>
nn <leader>j <C-]>
nn <leader>k ZZ
nn <leader>m :History<CR>
nn <leader>n :tabe<CR>
nn <leader>oo :e ~/Dropbox/org/gtd.org<CR>
nn <leader>o/ :Files ~/Dropbox/org<CR>
nn <leader>q :b#<CR>
nn <leader>rr :S/
nn <leader>ra :%S/
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
nn <leader>/ :Ag<CR>
nn <leader>` :terminal<CR>
nn <leader>' :Marks<CR>
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
" One button cmds
nn ! :!
" Terminal stuff
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" Local Vimrc
if filereadable('./.lvimrc')
  exec 'source ./.lvimrc'
endif
" easy omni complete
ino <C-SPACE> <C-X><C-O>
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
imap <silent> <expr> <C-E>
      \ neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" :
      \ "\<C-E>"

" Autoreload .vimrc
au! bufwritepost .vimrc source %
au! bufwritepost .lvimrc source %

