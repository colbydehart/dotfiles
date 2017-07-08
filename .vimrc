"==============================================================================
"================================COLBY=DEHART'S================================
"==================================WONDERFUL===================================
"===================================HORRIBLE===================================
"====================================VIMRC=====================================
"==============================================================================
"===================================GENERAL====================================
set statusline=[%l,%v]\ %t%m%r%h%w\ %y[%p%%]\ %{fugitive#statusline()}
set statusline+=\ %{ALEGetStatusLine()}
set t_Co=256                       "256 colors
set termguicolors                  "true color
set tabstop=2                      "2 spaces for tab
set shiftwidth=2                   "2 spaces for tab
set softtabstop=2                  "2 spaces for tab
set expandtab                      "no tabs
set list                           "show tab characters
set timeoutlen=1000 ttimeoutlen=-1 "better timeouts"
set number                         "line numbers
set mouse=a                        "use the mouse
set cindent                        "auto indent
set foldmethod=syntax              "code folding
set foldlevelstart=7               "don't fold it all
set textwidth=80                   "format at 80 lines
set ls=2                           "better status line
set clipboard=unnamedplus          "use system clipboard
let g:netrw_localrmdir='rm -r'     "recursive delete in netrw
let g:netrw_banner=0               "no banner on netrw
let g:netrw_browse_split=4         "open files in previous window
let g:netrw_liststyle=3            "use tree view for netrw
let g:netrw_preview=1              "open previews vertically
set nobackup                       "no backups!
set visualbell                     "no sounds!
set nohlsearch                     "no highlight search after
set ignorecase                     "ignore case when searching
set smartcase                      "don't ignore when i specify
set wildignorecase                 "case insensitive file search
set noswapfile                     "no swaps!
set diffopt=vertical               "vertical diff splits
set inccommand=split               "show substitute preview
set updatetime=2000                "a bit faster updatetime
set shortmess+=c                   "make that mess shorter?
:let mapleader = ' '               "leader is space
:let maplocalleader = ','          "localleader is comma
au! QuickFixCmdPost [^l]* cwindow  "open quickfix after search
au! QuickFixCmdPost l* lwindow     "open quickfix after search
au! InsertLeave * pc               "close preview on insert leave
"===================================IGNORE======================================
set wildignore+=*/_build
set wildignore+=*/.cljs_rhino_repl
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=.git
set wildignore+=.venv
"===================================FUNCTIONS===================================
func! StripTrailingWhitespace()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunc
"Clear trailing whitespace
au! BufWritePre * silent call StripTrailingWhitespace()
"===================================PLUGINS=====================================
call plug#begin()
"====================================COSMETIC===================================
Plug 'nightsense/vim-crunchbang'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf =
\ {
\  'guifgs': ['LightCoral', 'turquoise', 'PeachPuff1', 'SkyBlue1', 'OliveDrab2', 'tomato1', 'chartreuse1', 'MediumPurple1']
\}
"====================================UTILITY====================================
Plug 'jiangmiao/auto-pairs'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'rhysd/clever-f.vim'
Plug 'justinmk/vim-sneak'
"====================================BUILD/TEST=================================
Plug 'w0rp/ale'
Plug 'janko-m/vim-test'
Plug 'sbdchd/neoformat'
let g:ale_linters = {'javascript': ['flow'], 'jsx': ['flow'], 'elixir': ['credo']}
let g:test#strategy = 'neovim'
"==================================NAVIGATION===================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"==================================AUTOCOMPLETION===============================
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ervandew/supertab'
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1
let g:neosnippet#snippets_directory="/Users/colbydehart/dotfiles/snippets"
let g:neosnippet#scope_aliases = {}
let g:deoplete#keyword_patterns = {}
let g:deoplete#sources = {}
let g:gutentags_cache_dir = '~/.tags_cache'
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
"===================================WEB=========================================
Plug 'mattn/emmet-vim'
let g:user_emmet_settings = {'javascript.jsx': {'extends': 'jsx'}}
let g:vim_json_syntax_conceal=0
"==================================JAVASCRIPT===================================
Plug 'pangloss/vim-javascript', { 'for': [ 'javascript', 'javascript.jsx' ] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx']}
Plug 'flowtype/vim-flow',  {'for': ['javascript', 'javascript.jsx']}
let g:jsx_ext_required = 0  "Always use jsx syntax
let g:javascript_plugin_flow = 1
let g:flow#enable=0
let g:flow#autoclose = 1
autocmd BufWritePre *.js Neoformat
"==================================ELIXIR=======================================
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'
augroup elixir
  au!
  au FileType elixir nn <buffer> <localleader>a :A<CR>
  au FileType elixir nn <buffer> <localleader>d :ExDoc<Space>
  au FileType elixir nn <buffer> <localleader>i :IEx<CR>
  au FileType elixir nn <buffer> <localleader>t :Mix test<CR>
  au FileType elixir nn <buffer> <localleader>x :Mix<Space>
augroup END
"===================================ELM=========================================
Plug 'ElmCast/elm-vim', {'for': 'elm'}
Plug 'pbogut/deoplete-elm', {'for': 'elm'}
let g:elm_setup_keybindings = 0
let g:elm_format_autosave=1
augroup elm
  au!
  au FileType elm setlocal tabstop=4 shiftwidth=4 softtabstop=4
  au FileType elm nn <buffer> K :ElmShowDocs<CR>
  au FileType elm nn <buffer> <localleader>m :ElmMake<CR>
  au FileType elm nn <buffer> <localleader>r :ElmRepl<CR>
augroup END
"===================================CLOJURE=====================================
Plug 'guns/vim-clojure-static', {'for': ['clojure', 'clojurescript']}
Plug 'clojure-vim/async-clj-omni'
Plug 'tpope/vim-classpath'
Plug 'guns/vim-sexp', {'for': ['clojure', 'clojurescript']}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': ['clojure', 'clojurescript']}
Plug 'tpope/vim-fireplace', {'for': ['clojure', 'clojurescript']}
Plug 'tpope/vim-salve', {'for': ['clojure', 'clojurescript']}
Plug 'venantius/vim-cljfmt', {'for': ['clojure', 'clojurescript']}
let g:clojure_align_multiline_strings = 1
let g:clojure_align_subforms = 1
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
let g:deoplete#keyword_patterns.clojurescript = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
let g:deoplete#sources.clojure = ['async_clj', 'file']
  let g:clj_fmt_autosave = 0
au! BufEnter build.boot set filetype=clojure
augroup clojure
  au!
  au FileType clojure nn <buffer> <LocalLeader>C
        \ :Piggieback (figwheel-sidecar.repl-api/repl-env)<CR>
augroup END
"===================================RUBY========================================
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
"==================================PYTHON=======================================
Plug 'zchee/deoplete-jedi', {'for': 'python'}
augroup python
  au!
  au FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
  au FileType python nn <buffer> <localleader>f :0,$!yapf<CR>
augroup END
"===================================VIML========================================
Plug 'shougo/neco-vim'
Plug 'thinca/vim-themis'
augroup vim
  au!
  au FileType vim set foldmethod=indent
augroup END
"===================================FSHARP======================================
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
"===================================ETC.========================================
Plug 'jceb/vim-orgmode'
augroup org
  au!
  au FileType org nmap <buffer> O <Plug>OrgNewHeadingAboveNormal
  au FileType org nmap <buffer> o <Plug>OrgNewHeadingBelowNormal
augroup END
"=================================PLUG END======================================
call plug#end()
colo crunchbang
filetype plugin indent on
syntax enable
"===================================FAST=SEARCH=================================
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
"===================================KEYBINDINGS=================================
" Leader mappings
nn <leader>b :Buffers<CR>
nn [b :bp<CR>
nn ]b :bn<CR>
nn <leader>d :Explore<CR>
nn <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nn <leader>f :Files<CR>
nn <leader>h :h<Space>
nn <leader>g :tab split \| Gstatus \| wincmd o<CR>
nn <leader>i :Tags<CR>
nn <leader>j <C-]>
nn <leader>k ZQ
nn <silent> <leader>ln :ALENext<CR>
nn <silent> <leader>lp :ALEPrevious<CR>
nn <leader>m :History<CR>
nn <leader>n :tabe<CR>
nn <leader>o :e ~/Dropbox/org/gtd.org<CR>
nn <leader>q :b#<CR>
nn <leader>rr :S/
nn <leader>ra :%S/
nn <leader>sk :split<CR>
nn <leader>sj :split<CR><C-W>j
nn <leader>sh :vsplit<CR>
nn <leader>sl :vsplit<CR><C-W>l
nn <leader>t :terminal<CR>
nn <leader>vv :e ~/dotfiles/.vimrc<CR>
nn <leader>vl :e ./.lvimrc<CR>
nn <leader>w :w<CR>
nn <leader>x :
nn <leader>y :NeoSnippetEdit<CR>
nn <leader><CR> :
nn <leader>/ :Ag<CR>
nn <leader>' :Marks<CR>
" Open netrw for current file
nn - :30Hexplore %:p:h<CR>
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
" Easy close
nn <C-q> ZQ
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
" Easy omni complete
ino <C-SPACE> <C-X><C-O>
" Snippet expansion
imap <silent> <expr> <C-E>
      \ neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" :
      \ "\<C-E>"
" Local Vimrc
if filereadable('./.lvimrc')
  exec 'source ./.lvimrc'
endif
" Autoreload .vimrc
au! bufwritepost .vimrc source %
au! bufwritepost .lvimrc source %
