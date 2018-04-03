"==============================================================================
"================================COLBY=DEHART'S================================
"==================================WONDERFUL===================================
"===================================HORRIBLE===================================
"====================================VIMRC=====================================
"==============================================================================
"===================================GENERAL====================================
set t_Co=256                       "256 colors
set termguicolors                  "true color
set tabstop=2                      "2 spaces for tab
set shiftwidth=2                   "2 spaces for tab
set softtabstop=2                  "2 spaces for tab
set expandtab                      "no tabs
set nowrap                         "no softwrap
set noshowmode                     "don't show insert in echo area
set foldlevel=10                   "start with a big fold
set list                           "show tab characters
set timeoutlen=1000 ttimeoutlen=-1 "better timeouts
set number                         "line numbers
set relativenumber                 "line numbers
set mouse=a                        "use the mouse
set cindent                        "auto indent
set foldmethod=syntax              "code folding
set textwidth=80                   "format at 80 lines
set ls=2                           "better status line
set clipboard=unnamedplus          "use system clipboard
set hidden                         "allow jumping back and forth
                                   "between multiple unsaved buffers
set noshowmode                     "because airline...
set visualbell                     "no sounds!
set nohlsearch                     "no highlight search after
set ignorecase                     "ignore case when searching
set smartcase                      "don't ignore when i specify
set wildignorecase                 "case insensitive file search
set inccommand=nosplit             "show replaces while typing
set backup                         "backups
set noswapfile
set backupdir=~/.config/nvim/backup
set diffopt=vertical               "vertical diff splits
set updatetime=2000                "a bit faster updatetime
set shortmess+=c                   "make that mess shorter?
let g:netrw_liststyle = 0          "Tree style netrw
let g:netrw_browse_split = 4       "open netrw files in other window
let g:netrw_winsize = 25           "25 column width for netrw
let g:netrw_altv = 1               "Vertical split on right side
let g:netrw_localrmdir='rm -rf'     "Remove nonempty directories
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
set wildignore+=*/dist
"===================================FUNCTIONS===================================
func! StripTrailingWhitespace()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunc
"Clear trailing whitespace
au! BufWritePre * silent call StripTrailingWhitespace()

func! OpenOrCreateTerminal()
  let term = bufname('term://')
  if bufexists(term)
    :buffer term
  else
    :terminal
  endif
endfunc

let flowreadable = filereadable('./.flowconfig')

" override $VISUAL to use nvr inside neovim
if executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
"===================================PLUGINS=====================================
call plug#begin()
"====================================COSMETIC===================================
Plug 'jacoborus/tender.vim'
Plug 'nightsense/wonka'
Plug 'joshdick/onedark.vim'
Plug 'romainl/Apprentice'
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'justinmk/vim-sneak'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:gruvbox_contrast_light="soft"
let g:rainbow_active = 1
let g:rainbow_conf = {
      \  'guifgs': ['LightCoral', 'turquoise', 'PeachPuff1', 'SkyBlue1', 'OliveDrab2', 'tomato1', 'chartreuse1', 'MediumPurple1']
      \ }
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 0
"====================================UTILITY====================================
Plug 'tpope/vim-vinegar'
Plug 'jiangmiao/auto-pairs'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-abolish'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'christoomey/vim-tmux-navigator'
augroup magit
  au!
  au FileType magit nn <buffer> <TAB> za
augroup END
"====================================BUILD/TEST=================================
Plug 'w0rp/ale'
Plug 'janko-m/vim-test'
Plug 'sbdchd/neoformat'
let g:ale_linters = {
      \ 'elixir': ['mix', 'credo'],
      \ 'haskell': ['stack-ghc-mod', 'hlint'],
      \ 'elm': ['elm-make'],
      \ 'javascript': ['flow', 'prettier'],
      \ 'javascript.jsx': ['flow', 'prettier'],
      \ 'reason': ['merlin'],
      \ 'ocaml': ['merlin']
      \ }
let g:ale_linters_explicit = 1
let g:test#strategy = 'neovim'
let g:neoformat_only_msg_on_error = 0
"==================================NAVIGATION===================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"==================================AUTOCOMPLETION===============================
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ervandew/supertab'
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'javascript': flowreadable ? ['flow-language-server', '--stdio', '--try-flow-bin'] : ['javascript-typescript-stdio'],
      \ 'javascript.jsx': flowreadable ? ['flow-language-server', '--stdio', '--try-flow-bin'] : ['javascript-typescript-stdio'],
      \ 'typescript': flowreadable ? ['flow-language-server', '--stdio', '--try-flow-bin'] : ['javascript-typescript-stdio'],
      \ 'typescript.tsx': flowreadable ? ['flow-language-server', '--stdio', '--try-flow-bin'] : ['javascript-typescript-stdio'],
      \ 'python': ['pyls'],
      \ 'reason': ['ocaml-language-server', '--stdio'],
      \ 'ocaml': ['ocaml-language-server', '--stdio']
      \ }
let g:neosnippet#snippets_directory = "~/dotfiles/snippets"
let g:neosnippet#scope_aliases = {}
let g:deoplete#keyword_patterns = {}
let g:deoplete#sources = {}
let g:gutentags_cache_dir = '~/.tags_cache'
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
"===================================WEB=========================================
Plug 'mattn/emmet-vim' "quick HTML expansion
let g:user_emmet_settings = {}
let g:user_emmet_settings['javascript'] =  {'extends': 'jsx'}
let g:user_emmet_settings['javascript.jsx'] =  {'extends': 'jsx'}
let g:user_emmet_settings['typescript'] =  {'extends': 'jsx'}
let g:user_emmet_settings['typescript.tsx'] =  {'extends': 'jsx'}
Plug 'elzr/vim-json' "Better JSON highlighting
let g:vim_json_syntax_conceal=0
au! BufWritePre *.css,*.scss,*.sass Neoformat
"==================================JAVASCRIPT===================================
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0  "Always use jsx syntax
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote
" Use formatprg when available
let g:neoformat_try_formatprg = 1
au! BufWritePre *.js Neoformat silent! prettier
au! BufWritePre *.jsx Neoformat silent! prettier
"==================================TYPESCRIPT===================================
Plug 'leafgarland/typescript-vim', { 'for': [ 'typescript', 'typescript.tsx' ] }
Plug 'ianks/vim-tsx'
let g:neoformat_typescript_tsprettier = {
 \ 'exe': 'prettier',
 \ 'args': ['--stdin', '--parser', 'typescript', '--single-quote', 'true'],
 \ 'stdin': 1
 \ }
let g:neoformat_enabled_typescript = ['tsprettier']
au! BufWritePre *.ts silent! Neoformat
au! BufWritePre *.tsx silent! Neoformat
"==================================ELIXIR=======================================
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
augroup elixir
  au!
  au FileType elixir nn <buffer> <localleader>i :IEx<CR>
  au FileType elixir nn <buffer> <localleader>t :Mix test<CR>
  au FileType elixir nn <buffer> <localleader>x :Mix<Space>
  au BufWritePre *.ex Neoformat
  au BufWritePre *.exs Neoformat
augroup END
"=================================HASKELL=======================================
Plug 'eagletmt/neco-ghc'
Plug 'eagletmt/ghcmod-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'parsonsmatt/intero-neovim'
let g:haskellmode_completion_ghc = 0
let g:intero_start_immediately = 1 " Auto start intero for haskell files ?
let g:intero_use_neomake = 0 " Don't use neomake because ale is doing it.
autocmd! FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd! BufWritePre *.hs silent! Neoformat
"===============================OCAML/REASON====================================
Plug 'reasonml-editor/vim-reason-plus'
autocmd! BufWritePre *.re silent! Neoformat
"===================================ELM=========================================
Plug 'ElmCast/elm-vim', {'for': 'elm'}
Plug 'pbogut/deoplete-elm', {'for': 'elm'}
let g:elm_setup_keybindings = 0
let g:elm_format_autosave=1
augroup elm
  au!
  au FileType elm setlocal tabstop=4 shiftwidth=4 softtabstop=4 foldmethod=indent
  au FileType elm nn <buffer> K :ElmShowDocs<CR>
  au FileType elm nn <buffer> <localleader>m :ElmMakeMain<CR>
  au FileType elm nn <buffer> <localleader>r :ElmRepl<CR>
augroup END
"===================================CLOJURE=====================================
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-salve'
Plug 'clojure-vim/async-clj-omni', {'for': ['clojure', 'clojurescript']}
Plug 'guns/vim-sexp', {'for': ['clojure', 'clojurescript']}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': ['clojure', 'clojurescript']}
Plug 'venantius/vim-cljfmt', {'for': ['clojure', 'clojurescript']}
let g:clojure_align_multiline_strings = 1
let g:clojure_align_subforms = 1
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
let g:deoplete#keyword_patterns.clojurescript = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
let g:deoplete#sources.clojure = ['async_clj', 'buffer', 'file', 'tag']
let g:deoplete#sources.clojurescript = ['async_clj', 'buffer', 'file', 'tag']
let g:clj_fmt_autosave = 0
augroup clojure
  au!
  au BufEnter build.boot set filetype=clojure
  au FileType clojure nn <buffer> <LocalLeader>C
        \ :Piggieback (figwheel-sidecar.repl-api/repl-env)
  au FileType clojure nn <buffer> <localleader>f :Cljfmt<CR>
augroup END
"===================================RUST========================================
Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
augroup rust
  au!
  au BufWritePre *.rs Neoformat
augroup END
"===================================RUBY========================================
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
"==================================PYTHON=======================================
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
  au FileType vim setlocal foldmethod=indent
  au FileType vim setlocal keywordprg=:help
  au FileType vim vn <buffer> <localleader>e :<C-u>echo eval(getline(".")[col("'<")-1:col("'>")])<CR>
  au FileType vim nn <buffer> <localleader>e :echo eval(getline("."))<CR>
augroup END
"===================================FSHARP======================================
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
"===================================ETC.========================================
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'aquach/vim-http-client' "vim rest client
Plug 'jparise/vim-graphql'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'slim-template/vim-slim'
Plug 'sotte/presenting.vim'
Plug 'tpope/vim-dadbod'
let g:http_client_bind_hotkey=0
let g:http_client_json_ft='json'
let g:http_client_json_escape_utf=0
let g:http_client_result_vsplit=0
let g:http_client_focus_output_window=0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_autowrite = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_fenced_languages = ['elixir', 'js=javascript.jsx', 'clojure']
augroup markdown
  au!
  au FileType markdown setlocal tw=80 foldmethod=indent foldlevel=0
  au FileType markdown nn <buffer> <localleader>u :Toc<CR>
  au FileType markdown nn <buffer> <CR> :normal ge<CR>
augroup END
au! BufRead,BufNewFile *.rest set filetype=rest
au! FileType rest nn <buffer> <CR> :HTTPClientDoRequest<CR>
"=================================PLUG END======================================
call plug#end()
set background=dark
colo apprentice
let g:airline_theme='gruvbox'
filetype plugin indent on
syntax enable
" for showbreak
hi! NonText guifg=#337755
hi! link EndOfBuffer deusBg2
"===================================FAST=SEARCH=================================
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
"===================================AUGROUPS===================================
augroup lsp
  au!
  au FileType python,javascript,javascript.jsx,typescript,typescript.tsx,reason,ocaml setlocal omnifunc=LanguageClient#complete
  au FileType python,javascript,javascript.jsx,typescript,typescript.tsx,reason,ocaml nn <buffer> K :call LanguageClient_textDocument_hover()<cr>
  au FileType python,javascript,javascript.jsx,typescript,typescript.tsx,reason,ocaml nn <buffer> gd :call LanguageClient_textDocument_definition()<cr>
  au FileType python,javascript,javascript.jsx,typescript,typescript.tsx,reason,ocaml nn <buffer> <localleader>f :call LanguageClient_textDocument_formatting()<cr>
  au FileType python,javascript,javascript.jsx,typescript,typescript.tsx,reason,ocaml nn <buffer> <localleader>r :call LanguageClient_textDocument_rename()<cr>
  au FileType python,javascript,javascript.jsx,typescript,typescript.tsx,reason,ocaml nn <buffer> <localleader>u :call LanguageClient_textDocument_documentSymbol()<cr>
augroup END
"===================================KEYBINDINGS=================================
" Buffer jumper
nn [b :bp<CR>
nn ]b :bn<CR>
nn <BACKSPACE> :bp<CR>
" Leader mappings
nn <leader><leader> :b#<CR>
" nn <leader>a
nn <leader>b :Buffers<CR>
nn <leader>d :Vexplore! .<CR>
nn <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nn <leader>f :Files<CR>
nn <leader>g :Magit<CR>
nn <leader>h :Helptags<CR>
nn <leader>i :Tags<CR>
nn <leader>j <C-]>
nn <leader>k :q<CR>
nn <silent> <leader>ln :ALENext<CR>
nn <silent> <leader>lp :ALEPrevious<CR>
nn <leader>m :History<CR>
nn <leader>n :tabe<CR>
nn <leader>oo :e ~/Documents/vimwiki/index.md<CR>
nn <leader>of :FZF ~/Documents/vimwiki<CR>
nn <leader>p :cl<CR>
nn <leader>q :qa!<CR>
nn <leader>rr :S/
nn <leader>ra :%S/
nn <leader>sk :split<CR>
nn <leader>sj :split<CR><C-W>j
nn <leader>sh :vsplit<CR>
nn <leader>sl :vsplit<CR><C-W>l
nn <silent> <leader>t :call OpenOrCreateTerminal()<CR>
nn <leader>u :BTags<CR>
nn <leader>vv :e ~/dotfiles/.vimrc<CR>
nn <leader>vl :e ./.lvimrc<CR>
nn <leader>w :w<CR>
nn <leader>x :
nn <leader>y :NeoSnippetEdit<CR>
nn <leader>z :set foldlevel=1<cr>
nn <leader><CR> :
nn <leader>/ :Ag<CR>
nn <leader>' :Marks<CR>
" Open netrw for current file
nn - :Vexplore!<CR>
" Refresh netrw
au! FileType netrw nn <buffer> r :e .<CR>
" New file netrw
au! FileType netrw nn <buffer> i :silent !touch <C-R>=b:netrw_curdir<CR>/
" Window navigation
nn <C-j> <C-W>j
nn <C-k> <C-W>k
nn <C-h> <C-W>h
nn <C-l> <C-W>l
" Arrows navigate buffers
nn <Left> :vertical res -5<CR>
nn <Right> :vertical res +5<CR>
nn <Up> :res +5<CR>
nn <Down> :res -5<CR>
" fast macros
nnoremap Q @q
" (g)oto (d)efinition
nn gd <C-]>
" Tab navigation
nn H gT
nn L gt
" One button cmds
nn ! :!
" I never really use command mode
nn q: :q
" Terminal stuff
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
au TermOpen * setlocal nonumber norelativenumber bufhidden=hide
" Easy omni complete
ino <C-Space> <C-x><C-o>
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
