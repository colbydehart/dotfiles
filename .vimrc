
"===============================COLBY=DEHART'S================================
"==================================WONDERFUL===================================
"===================================HORRIBLE===================================
"====================================VIMRC=====================================
"==============================================================================
"===================================GENERAL====================================
set cindent                        "auto indent
set clipboard=unnamedplus          "use system clipboard
set diffopt=vertical               "vertical diff splits
set expandtab                      "no tabs
set foldlevel=10                   "start with a big fold
set foldmethod=syntax              "code folding
set hidden                         "allow jumping back and forth between multiple unsaved buffers
set ignorecase                     "ignore case when searching
set inccommand=nosplit             "show replaces while typing
set list                           "show tab characters
set ls=2                           "better status line
set mouse=a                        "use the mouse
set nohlsearch                     "no highlight search after
set noshowmode                     "don't show insert in echo area
set noswapfile                     "no swap files
set nowrap                         "no softwrap
set number                         "line numbers
set relativenumber                 "line numbers
set shiftwidth=2                   "2 spaces for tab
set shortmess+=c                   "make that mess shorter?
set smartcase                      "don't ignore when i specify
set softtabstop=2                  "2 spaces for tab
set tabstop=2                      "2 spaces for tab
set termguicolors                  "true color
set textwidth=80                   "format at 80 lines
set timeoutlen=1000 ttimeoutlen=-1 "better timeouts
set updatetime=2000                "a bit faster updatetime
set visualbell                     "no sounds!
set wildignorecase                 "case insensitive file search
let g:netrw_browse_split = 4       "open netrw files in other window
let g:netrw_winsize = 25           "25 column width for netrw
let g:netrw_altv = 1               "Vertical split on right side
let g:netrw_localrmdir='rm -rf'    "Remove nonempty directories
let mapleader = ' '                "leader is space
let maplocalleader = ','           "localleader is comma
let g:netrw_browsex_viewer="open"  "open stuff with open
au! QuickFixCmdPost [^l]* cwindow  "open quickfix after search
au! QuickFixCmdPost l* lwindow     "open quickfix after search
au! InsertLeave * pc               "close preview on insert leave

""===================================IGNORE======================================
set wildignore+=*/_build
set wildignore+=*/.cljs_rhino_repl
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=.git
set wildignore+=.venv
set wildignore+=*/dist
set wildignore+=*.bs.js

"===================================FUNCTIONS===================================
func! OpenOrCreateTerminal()
  let term = bufname('term://')
  if bufexists(term)
    :buffer term
  else
    :terminal
  endif
endfunc

" Conditionally load vim plugins.
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, {'on': [], 'for': [] })
endfunction

" override $VISUAL to use nvr inside neovim
if executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

"===================================PLUGINS=====================================
call plug#begin()

"====================================COSMETIC===================================
Plug 'joshdick/onedark.vim'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'

"====================================UTILITY====================================
Plug 'jiangmiao/auto-pairs'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jreybert/vimagit'
Plug 'tyru/open-browser.vim'
Plug 'justinmk/vim-sneak'
let g:sneak#use_ic_scs = 1
let g:sneak#map_netrw = 0
" tpope shrine.
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-eunuch'
" Disable netrw gx mapping.
let g:netrw_nogx = get(g:, 'netrw_nogx', 1)
nmap gx <Plug>(openbrowser-open)
vmap gx <Plug>(openbrowser-open)
augroup magit
  au!
  au FileType magit nn <buffer> <TAB> za
augroup END

"==================================NAVIGATION===================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"==================================AUTOCOMPLETION===============================
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
let g:neosnippet#snippets_directory = "~/dotfiles/snippets"
let g:neosnippet#scope_aliases = {}
let g:coc_auto_copen = 0
autocmd User CocQuickfixChange :call fzf_quickfix#run()

"===================================WEB=========================================
Plug 'mattn/emmet-vim' "quick HTML expansion
let g:user_emmet_settings = {}
let g:user_emmet_settings['javascript'] =  {'extends': 'jsx'}
let g:user_emmet_settings['javascript.jsx'] =  {'extends': 'jsx'}
let g:user_emmet_settings['typescript'] =  {'extends': 'jsx'}
let g:user_emmet_settings['typescript.tsx'] =  {'extends': 'jsx'}
Plug 'elzr/vim-json' "Better JSON highlighting
let g:vim_json_syntax_conceal=0

"==================================JAVASCRIPT===================================
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
let g:jsx_ext_required = 0  "Always use jsx syntax

"==================================TYPESCRIPT===================================
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'typescript.tsx']}
Plug 'peitalin/vim-jsx-typescript', {'for': ['typescript', 'typescript.tsx']}

"==================================ELIXIR=======================================
Plug 'elixir-lang/vim-elixir', {'for': ['elixir']}

"===============================OCAML/REASON====================================
Plug 'reasonml-editor/vim-reason-plus', {'for': ['reason', 'ocaml']}

"===================================ELM=========================================
Plug 'ElmCast/elm-vim', {'for': 'elm'}
let g:elm_setup_keybindings = 0
let g:elm_format_autosave=1
au! FileType elm setlocal tabstop=4 shiftwidth=4 softtabstop=4 foldmethod=indent
au! FileType elm nn <buffer> K :ElmShowDocs<CR>

"===================================CLOJURE=====================================
Plug 'tpope/vim-fireplace', {'for': ['clojure', 'clojurescript']}
Plug 'tpope/vim-classpath', {'for': ['clojure', 'clojurescript']}
Plug 'guns/vim-clojure-static', {'for': ['clojure', 'clojurescript']}
Plug 'guns/vim-sexp', {'for': ['clojure', 'clojurescript']}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': ['clojure', 'clojurescript']}
let g:clojure_align_multiline_strings = 1
let g:clojure_align_subforms = 1
augroup clojure
  au!
  au BufEnter build.boot set filetype=clojure
augroup END

"===================================RUST========================================
Plug 'rust-lang/rust.vim', {'for': 'rust'}

"===================================RUBY========================================
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }

"==================================PYTHON=======================================
au! FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

"===================================VIML========================================
Plug 'shougo/neco-vim', {'for': ['vim']}
au! FileType vim setlocal foldmethod=indent keywordprg=:help

"===================================ETC.========================================
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'jparise/vim-graphql' " graphql syntax support
Plug 'godlygeek/tabular' " allows formatting of markdown tables
Plug 'plasticboy/vim-markdown' " better markdown support
let g:vim_markdown_conceal = 0
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
au! BufEnter *.md setlocal tw=80 foldmethod=indent
au! BufEnter *.md nmap <buffer> <CR> <Plug>Markdown_EditUrlUnderCursor

"=================================PLUG END======================================
call plug#end()
set background=dark
colo onedark

filetype plugin indent on
syntax enable

""===================================FAST=SEARCH=================================
if executable('ag') 
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"===================================LSP Bindings===================================
augroup lsp
  au!
  au FileType reason,ocaml,rust,python,javacript,javascript.jsx,typescript,typescript.tsx,elixir nn <silent> <buffer> K :call CocAction("doHover")<CR>
  au FileType reason,ocaml,rust,python,javacript,javascript.jsx,typescript,typescript.tsx,elixir nn <silent> <buffer> gd :call CocAction("jumpDefinition")<CR>
  au FileType reason,ocaml,rust,python,javacript,javascript.jsx,typescript,typescript.tsx,elixir nn <silent> <buffer> gr :call CocAction("jumpReferences")<CR>
  au FileType reason,ocaml,rust,python,javacript,javascript.jsx,typescript,typescript.tsx,elixir nn <buffer> <localleader>i :call CocAction("workspaceSymbols")<CR>
  au FileType reason,ocaml,rust,python,javacript,javascript.jsx,typescript,typescript.tsx,elixir nn <buffer> <localleader>r :call CocAction("rename")<CR>
  au CursorHoldI,CursorMovedI * call CocAction('showSignatureHelp')
  au! bufwritepre *.tsx :CocCommand prettier.formatFile
  au! bufwritepre *.jsx :CocCommand prettier.formatFile
  au! bufwritepre *.ts :CocCommand prettier.formatFile
  au! bufwritepre *.js :CocCommand prettier.formatFile
augroup END

"===================================KEYBINDINGS=================================
" Buffer jumper
nn <BS> :b#<CR>

" Leader mappings
nn <leader>' :Marks<CR>
nn <leader>/ :Ag<CR>
nn <leader>; :Commands<CR>
nn <leader><CR> :
nn <leader><leader> :b#<CR>
nn <leader>a :Lines<CR>
nn <leader>b :Buffers<CR>
nn <leader>d :Vexplore! .<CR>
nn <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nn <leader>f :Files<CR>
nn <leader>g :Magit<CR>
nn <leader>h :Helptags<CR>
nn <leader>i :Tags<CR>
nn <leader>j <C-]>
nn <leader>k :q<CR>
nmap <silent> <leader>ld <Plug>(coc-diagnostic-info)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nn <leader>m :History<CR>
nn <leader>n :tabe<CR>
nn <leader>of :FZF ~/Documents/vimwiki<CR>
nn <leader>oo :e ~/Documents/vimwiki/index.md<CR>
nn <leader>p :lw<CR>
nn <leader>q :qa<CR>
nn <leader>ra :%s/
nn <leader>rr :s/
nn <leader>sh :vsplit<CR>
nn <leader>sj :split<CR><C-W>j
nn <leader>sk :split<CR>
nn <leader>sl :vsplit<CR><C-W>l
nn <leader>u :BTags<CR>
nn <leader>vl :e ./.lvimrc<CR>
nn <leader>vo :e ~/.config/oni/config.tsx<CR>
nn <leader>vv :e ~/dotfiles/.vimrc<CR>
nn <leader>w :w<CR>
nn <leader>x mzgggqG`z
nn <leader>y :NeoSnippetEdit<CR>
nn <leader>zc :set foldlevel=1<cr>
nn <leader>zo :set foldlevel=99<cr>
nn <silent> <leader>t :call OpenOrCreateTerminal()<CR>

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

" Etc. keymappings
nn - :Vexplore!<CR>
nnoremap Q @q
nn / /\v
nn ? ?\v
nn gd <C-]>
nn H gT
nn L gt
nn ! :!
nn q: :q

" Terminal stuff
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
au TermOpen * setlocal nonumber norelativenumber bufhidden=hide
autocmd BufWinEnter,WinEnter term://* startinsert

" Tab completion
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
imap <C-space> coc#refresh();

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
