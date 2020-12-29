"===============================COLBY=DEHART'S================================
"==================================WONDERFUL===================================
"===================================HORRIBLE===================================
"====================================VIMRC=====================================
"==============================================================================
"===================================GENERAL====================================
set autoread                       "auto relaod
set cindent                        "auto indent
set clipboard=unnamedplus          "use system clipboard
set diffopt=vertical               "vertical diff splits
set expandtab                      "no tabs
set foldlevel=20                   "start with a big fold
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
set conceallevel=0                 "no concealing, confusing
let g:netrw_banner = 0             "no banner
let g:netrw_browse_split = 4       "open netrw files in other window
let g:netrw_winsize = 35           "25 column width for netrw
let g:netrw_altv = 1               "Vertical split on right side
let g:netrw_rmf_cmd="rm -rf"       "Remove nonempty directories
let g:netrw_localrmdir="rm -rf"
let mapleader = ' '                "leader is space
let maplocalleader = ','           "localleader is comma
let g:netrw_browsex_viewer="open"  "open stuff with open
au! QuickFixCmdPost [^l]* cwindow  "open quickfix after search
au! QuickFixCmdPost l* lwindow     "open quickfix after search
au! InsertLeave * pc               "close preview on insert leave
""===================================PLATFORMS====================================
" If we are in WSL...
if has('wsl')
  "  Set the clipboard properly
  "  see: https://superuser.com/questions/1291425/windows-subsystem-linux-make-vim-use-the-clipboard
  let g:clipboard = {
        \   'name': 'win32yank-wsl',
        \   'copy': {
        \      '+': 'win32yank.exe -i --crlf',
        \      '*': 'win32yank.exe -i --crlf',
        \    },
        \   'paste': {
        \      '+': 'win32yank.exe -o --lf',
        \      '*': 'win32yank.exe -o --lf',
        \   },
        \   'cache_enabled': 0,
  }
endif

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
set wildignore+=.DS_Store
set wildignore+=.rts2_*

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

" Daily log
function! OpenLog()
  silent exe ":e ~/notes/log/" . strftime("%Y/%m/%d") . ".md"
  silent exe ":!mkdir -p %:h"
endfunction

function! CondenseLog()
  let logfiles = glob('~/notes/log/**/*.md', 0, 1)
  let journal = glob('~/notes/journal.md')
  silent exec ':e ' . journal
  for f in logfiles
    call append(line('.'), readfile(f))
    call append(line('.'), '') " blank line
    " gives us a date header like '## 2020/10/21'
    call append(line('.'), "## " . split(f, 'log/')[1][:-4])
    call append(line('.'), '') " blank line
    silent exec ':!rm ' . f
  endfor
endfunction

"===================================PLUGINS=====================================
call plug#begin()

"====================================COSMETIC===================================
Plug 'franbach/miramare'
Plug 'mhinz/vim-janah'
Plug 'skbolton/embark'
Plug 'nightsense/snow'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'mechatroner/rainbow_csv'

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', "calendar"] ]
      \ },
      \ 'component': {
      \   'calendar': "%{strftime('%H:%M')}"
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

"====================================UTILITY====================================
Plug 'Raimondi/delimitMate'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tyru/open-browser.vim'
Plug 'justinmk/vim-sneak'
" ai and ii indent level text objects
Plug 'michaeljsmith/vim-indent-object'
let delimitMate_expand_cr=1
let delimitMate_jump_expansion=1
let delimitMate_balance_matchpairs=1
let g:sneak#use_ic_scs = 1
let g:sneak#map_netrw = 0
let g:sneak#label = 1
" tpope shrine.
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'
" Disable netrw gx mapping.
let g:netrw_nogx = get(g:, 'netrw_nogx', 1)
" tpope trying to take over my dang <CR>
let g:endwise_no_mappings = 1
nmap gx <Plug>(openbrowser-open)
vmap gx <Plug>(openbrowser-open)
au! FileType fugitive nm <buffer> <TAB> =

"==================================NAVIGATION===================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"==================================AUTOCOMPLETION===============================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'Shougo/echodoc.vim'
Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories = [$HOME.'/dotfiles/snippets']
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:vista_default_executive = 'coc'
 let g:coc_global_extensions = [
\    'coc-json',
\    'coc-tsserver',
\    'coc-css',
\    'coc-eslint',
\    'coc-html',
\    'coc-json',
\    'coc-prettier',
\    'coc-syntax',
\    'coc-ultisnips',
\    'coc-elixir',
\    'coc-python'
\    ]

"===================================WEB=========================================
Plug 'stephenway/postcss.vim'
Plug 'mattn/emmet-vim'
let g:user_emmet_settings = {
\  'javascript' : {'extends' : 'jsx'},
\  'javascript.jsx' : {'extends' : 'jsx'},
\  'typescript' : {'extends' : 'jsx'},
\  'typescript.tsx' : {'extends' : 'jsx'},
\  'slime': {'extends': 'slim'}
\}
Plug 'elzr/vim-json' "Better JSON highlighting
Plug 'kevinoid/vim-jsonc'
let g:vim_json_syntax_conceal=0
au! BufEnter .babelrc setlocal ft=json
au! BufEnter .prettierrc setlocal ft=json
au! BufEnter .eslintrc setlocal ft=json
au! BufEnter *.postcss,*.pcss setlocal ft=postcss

"==================================JAVASCRIPT===================================
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
Plug 'posva/vim-vue'
let g:jsx_ext_required = 0  "Always use jsx syntax
let g:vue_disable_pre_processors=1

"==================================TYPESCRIPT===================================
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
au! FileType typescript set foldmethod=indent
au! FileType typescript.tsx set foldmethod=indent

"==================================ELIXIR=======================================
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'slime-lang/vim-slime-syntax'
au BufEnter *.leex set filetype=eelixir
let g:mix_format_on_save = 1
au! BufNewFile,BufRead *.slimleex set filetype=slime
au! BufNewFile,BufRead *.slim set filetype=slime

"===================================RUST========================================
Plug 'rust-lang/rust.vim', {'for': 'rust'}

"=================================CLOJURE=======================================
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

"==================================PYTHON=======================================
au! FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 foldmethod=indent textwidth=120
Plug 'tweekmonster/django-plus.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " better syntax highlighting

"===================================VIML========================================
Plug 'shougo/neco-vim', {'for': ['vim']}
au! FileType vim setlocal foldmethod=indent keywordprg=:help

"===================================ETC.========================================
Plug 'editorconfig/editorconfig-vim'
Plug 'freitass/todo.txt-vim' " Todos
Plug 'neo4j-contrib/cypher-vim-syntax' " neo4j cypher syntax
Plug 'jparise/vim-graphql' " graphql syntax
Plug 'godlygeek/tabular' " allows formatting of markdown tables
Plug 'plasticboy/vim-markdown'
Plug 'chr4/nginx.vim'
Plug 'hashivim/vim-terraform'
Plug 'cespare/vim-toml'
Plug 'freitass/todo.txt-vim'
Plug 'christoomey/vim-tmux-navigator'
let g:ftplugin_sql_omni_key = 0
au! BufEnter,BufRead someday.txt set ft=todo
au! FileType markdown setlocal tw=80 foldmethod=indent cole=0 wrap
au! FileType yaml setlocal foldmethod=indent
au! FileType qf setlocal wrap

"=================================PLUG END======================================
call plug#end()
set background=dark
colo janah
filetype plugin indent on
syntax enable

""===================================FAST=SEARCH=================================
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif



"===================================KEYBINDINGS=================================
" Buffer jumper
nn <BS> :b#<CR>

" LSP Bindings
nn <silent> K :call CocAction("doHover")<CR>
nn <silent> gd :call CocAction("jumpDefinition")<CR>
nn <silent> gr :call CocAction("jumpReferences")<CR>
nn <silent> <localleader>i :CocAction("getWorkspaceSymbols")<CR>
nn <silent> <localleader>a :CocAction<CR>
vm <silent> <localleader>a <Plug>(coc-codeaction-selected)
xm <silent> <localleader>a <Plug>(coc-codeaction-selected)
nn <silent> <localleader>r :call CocAction("rename")<CR>
" Leader mappings
nn <leader>' :Marks<CR>
nn <leader>/ :Rg<CR>
nn <leader>; :Commands<CR>
nn <leader><CR> :
nn <leader><leader> :b#<CR>
nn <leader>a :Vista<CR>
nn <leader>b :Buffers<CR>
nn <leader>c :Lines<CR>
nn <leader>d :Vexplore! .<CR>
nn <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nn <leader>f :Files<CR>
nn <leader>g :Gstatus<CR>
nn <leader>h :Helptags<CR>
nn <leader>i :Tags<CR>
nn <silent> <leader>jc :call CondenseLog()<CR>
nn <silent> <leader>jl :e ~/notes/journal.md<CR>
nn <silent> <leader>jj :FZF ~/notes<CR>
nn <silent> <leader>jt :e ~/notes/todo.txt<CR>
nn <leader>k :q<CR>
nmap <silent> <leader>ld <Plug>(coc-diagnostic-info)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nn <leader>m :History<CR>
nn <leader>n :tabe<CR>
nn <leader>o :Vista<CR>
nn <leader>p :cw<CR>
nn <leader>q :qa<CR>
nn <leader>ra :%s/
nn <leader>rr :s/
nn <leader>sh :vsplit<CR>
nn <leader>sj :split<CR><C-W>j
nn <leader>sk :split<CR>
nn <leader>sl :vsplit<CR><C-W>l
nn <silent> <leader>t :call OpenOrCreateTerminal()<CR>
" nn <leader>u 
nn <leader>vl :e ./.lvimrc<CR>
nn <leader>vv :e ~/.config/nvim/init.vim<CR>
nn <leader>vt :e ~/dotfiles/.tmux.conf<CR>
nn <leader>vz :e ~/dotfiles/.zshrc<CR>
nn <leader>w :w<CR>
nn <leader>x mzgggqG`z
nn <leader>y :UltiSnipsEdit<CR>
function! ToggleFold() abort
  if &foldlevel < 99
    set foldlevel=99
  else
    setlocal foldlevel=0
  endif
endfunction
nn <leader>z :call ToggleFold()<cr>

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
nn H gT
nn L gt
nn ! :!
nn q: :q
nn Z zA
im <C-c> <ESC>

" Terminal stuff
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
au TermOpen * setlocal nonumber norelativenumber bufhidden=hide


inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ "\<Tab>"

inoremap <silent><expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" :
  \ "\<S-Tab>"

inoremap <silent><expr> <C-n>
  \ pumvisible() ? "\<C-n>" :
  \ coc#refresh()

" Insert ultisnip snippet on Enter
" https://github.com/neoclide/coc.nvim/wiki/Using-snippets
inoremap <silent><expr> <CR>
      \ pumvisible() ?
      \ coc#_select_confirm() : 
      \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Local Vimrc
if filereadable('./.lvimrc')
  exec 'source ./.lvimrc'
endif

" Autoreload .vimrc
au! bufwritepost init.vim source %
au! bufwritepost .lvimrc source %
