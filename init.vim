"===============================COLBY=DEHART'S================================
"==================================WONDERFUL===================================
"===================================HORRIBLE===================================
"====================================VIMRC=====================================
"==============================================================================
"===================================GENERAL====================================
set autoread                       "auto relaod
set cindent                        "auto indent
set cmdheight=2                    "big echo area
set clipboard=unnamedplus          "use system clipboard
set diffopt=vertical               "vertical diff splits
set completeopt=menuone,noselect
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
set timeoutlen=300 ttimeoutlen=-1  "better timeouts
set updatetime=300                 "a bit faster updatetime
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
let g:python3_host_prog = "~/.config/nvim/venv/bin/python"
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
        \ }
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
Plug 'sainnhe/gruvbox-material'
Plug 'skbolton/embark'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'mechatroner/rainbow_csv'
Plug 'liuchengxu/vim-which-key'
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:lightline = {
      \ 'colorscheme': 'embark',
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
let g:indentLine_fileTypeExclude = ['help', 'terminal', 'calendar']
"====================================UTILITY====================================
Plug 'jiangmiao/auto-pairs'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'tyru/open-browser.vim'
Plug 'jpalardy/vim-slime' " better repls
let g:slime_target = "neovim"
let g:slime_python_ipython = 1
Plug 'tpope/vim-rsi' " emacs readline bindings
Plug 'tpope/vim-fugitive' " git
Plug 'tpope/vim-rhubarb' " github
Plug 'tpope/vim-abolish' " substitution
Plug 'tpope/vim-dadbod' " databases
Plug 'tpope/vim-dispatch' " used by other plugins
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-vinegar' " netrw+
Plug 'tpope/vim-surround' " ysiw
Plug 'tpope/vim-commentary' " comments
Plug 'tpope/vim-repeat' " better .
let g:AutoPairsMapCR = 0
" Disable netrw gx mapping.
let g:netrw_nogx = get(g:, 'netrw_nogx', 1)
nmap gx <Plug>(openbrowser-open)
vmap gx <Plug>(openbrowser-open)
au! FileType fugitive nm <buffer> <TAB> =

"==================================NAVIGATION===================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
let g:sneak#use_ic_scs = 1
let g:fzf_preview_window = []

"==================================AUTOCOMPLETION===============================
Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories = [$HOME.'/dotfiles/snippets']
let g:UltiSnipsExpandTrigger = "<C-l>"
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'neoclide/coc.nvim'

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-git',
      \ 'coc-pyright',
      \ 'coc-elixir',
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ ]
"===================================WEB=========================================
Plug 'stephenway/postcss.vim'
Plug 'mattn/emmet-vim'
let g:user_emmet_settings = {
\  'javascript' : {'extends' : 'jsx'},
\  'javascriptreact' : {'extends' : 'jsx'},
\  'typescript' : {'extends' : 'jsx'},
\  'typescriptreact' : {'extends' : 'jsx'},
\}
Plug 'elzr/vim-json' "Better JSON highlighting
Plug 'kevinoid/vim-jsonc' " json with comments
let g:vim_json_syntax_conceal=0
au! BufEnter .babelrc setlocal ft=json
au! BufEnter .prettierrc setlocal ft=json
au! BufEnter .eslintrc setlocal ft=json
au! BufEnter *.postcss,*.pcss setlocal ft=postcss

"==================================JAVASCRIPT===================================
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0  "Always use jsx syntax

"==================================TYPESCRIPT===================================
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
au! FileType typescript set foldmethod=indent
au! FileType typescriptreact set foldmethod=indent

"==================================ELIXIR=======================================
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-mix-format'
au BufEnter *.leex set filetype=eelixir
let g:mix_format_on_save = 1

"===================================RUST========================================
Plug 'rust-lang/rust.vim'

"=================================CLOJURE=======================================
Plug 'liquidz/vim-iced'
Plug 'liquidz/vim-iced-coc-source'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
let g:iced_enable_default_key_mappings = v:true
  let g:iced_default_key_mapping_leader = '<localleader>'
augroup clojure
  au! FileType clojure,clojurescript nn gd :IcedDefJump<CR>
  au! FileType clojure,clojurescript nn gr :IcedBrowseReferences<CR>
augroup END

"==================================PYTHON=======================================
Plug 'tweekmonster/django-plus.vim'

"===================================VIML========================================
au! FileType vim setlocal foldmethod=indent keywordprg=:help

"===================================ETC.========================================
Plug 'editorconfig/editorconfig-vim'
Plug 'neo4j-contrib/cypher-vim-syntax' " neo4j cypher syntax
Plug 'jparise/vim-graphql' " graphql syntax
Plug 'godlygeek/tabular' " allows formatting of markdown tables
Plug 'plasticboy/vim-markdown'
Plug 'chr4/nginx.vim'
Plug 'hashivim/vim-terraform'
Plug 'cespare/vim-toml'
Plug 'n0v1c3/vira', { 'do': './install.sh', 'branch': 'dev' }
Plug 'sotte/presenting.vim'
let g:ftplugin_sql_omni_key = 0
let vira_config_servers = $HOME . '/.config/vira/vira_servers.json'
au! BufEnter,BufRead someday.txt set ft=todo
au! FileType markdown setlocal tw=80 foldmethod=indent cole=0 wrap
au! FileType yaml setlocal foldmethod=indent
au! FileType qf setlocal wrap

"=================================PLUG END======================================
call plug#end()
set background=dark
colo embark
filetype plugin indent on
syntax enable
packloadall

""===================================FAST=SEARCH=================================
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"===================================KEYBINDINGS=================================

" COC LSP bindings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K :call CocActionAsync('doHover')<CR>
nmap <silent> <localleader>f <Plug>(coc-format)
nmap <silent> <localleader>r <Plug>(coc-rename)
nmap <silent> <localleader>a  <Plug>(coc-codeaction)
nmap <silent> <localleader>e  :call CocActionAsync('diagnosticInfo')<CR>

" Leader stuff
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
nn <silent> <leader>jl :call OpenLog()<CR>
nn <silent> <leader>jj :FZF ~/notes<CR>
nn <silent> <leader>jt :e ~/notes/todo.txt<CR>
nn <leader>k :q<CR>
nn <leader>ln <Plug>(coc-diagnostic-next-error)
nn <leader>ll :<C-u>CocList diagnostics<cr>
nn <leader>lp <Plug>(coc-diagnostic-prev-error)
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
nn <leader>va :e ~/dotfiles/.bash_aliases<CR>
nn <leader>vl :e ./.lvimrc<CR>
nn <leader>vv :e ~/dotfiles/init.vim<CR>
nn <leader>vt :e ~/dotfiles/.tmux.conf<CR>
nn <leader>vu :e ~/dotfiles/init.lua<CR>
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

" Autocomplete mappings
" Use tab for trigger completion with characters ahead and navigate.  NOTE: Use
" command ':verbose imap <tab>' to make sure tab is not mapped by other plugin
" before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-l> coc#refresh()

" Etc. keymappings
nn - :Vexplore!<CR>
nn Q @q
nn / /\v
nn ? ?\v
nn H gT
nn L gt
au! FileType calendar nn H gT
au! FileType calendar nn L gt
nn ! :!
nn q: :q
nn Z zA
im <C-c> <ESC>
nn <BS> :b#<CR>

" Terminal stuff
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
au TermOpen * setlocal nonumber norelativenumber bufhidden=hide

" Local Vimrc
if filereadable('./.lvimrc')
  exec 'source ./.lvimrc'
endif

" Autoreload .vimrc
au! bufwritepost init.vim source %
au! bufwritepost .lvimrc source %
