"==============================================================================
"================================COLBY=DEHART'S================================
"==================================WONDERFUL===================================
"===================================HORRIBLE===================================
"====================================VIMRC=====================================
"==============================================================================
"===================================GENERAL====================================
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set statusline=[%l,%v]\ %t%m%r%h%w\ %y[%p%%]\ %{fugitive#statusline()}
set t_Co=256                       "256 colors
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
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase=1
let g:EasyMotion_keys = 'arstdhneioqwfpgjluy;zxcvbkm,./' "Colemak
let g:EasyMotion_do_mapping=0

"===================================COSMETIC====================================

Plug 'juanpabloaj/vim-pixelmuerto'
Plug 'pbrisbin/vim-colors-off'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
Plug 'AndrewRadev/splitjoin.vim'
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
Plug 'tpope/vim-projectionist'

"===================================BUILD/TEST==================================

Plug 'neomake/neomake'
let g:neomake_error_sign = {'text': '✘', 'texthl': 'WarningMessage'}
let g:neomake_warning_sign = { 'text': '⚑', 'texthl': 'Function' }
let g:neomake_message_sign = { 'text': '➤', 'texthl': 'Title' }
let g:neomake_info_sign = {'text': 'i', 'texthl': 'HelpCommand'}
au! BufWritePost,BufRead * Neomake
Plug 'janko-m/vim-test'
let g:test#strategy = 'neovim'

"===================================COMPLETION==================================

Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup=1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni#input_patterns = {}
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

let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_jsx_enabled_makers = ['standard']
let g:neosnippet#scope_aliases['javascript.jsx'] = 'javascript,jsx'
Plug 'pangloss/vim-javascript', { 'for': [ 'javascript.jsx', 'javascript' ] }
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript.jsx']}
let g:jsx_ext_required = 0  "Always use jsx syntax
Plug 'carlitux/deoplete-ternjs', {
      \ 'do': 'yarn global add tern',
      \ 'for': ['jsx', 'javascript', 'javascript.jsx']
      \ }
let g:tern_request_timeout=1  "Use tern completion
let g:tern_show_argument_hints="on_hold"  "Give me argument hints
let g:tern#filetypes = [ 'javascript', 'jsx', 'javascript.jsx' ]

"===================================ELIXIR======================================

Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'c-brenn/phoenix.vim', {'for': 'elixir'}
Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
" track https://github.com/neomake/neomake/pull/300
" to see if this gets pulled into neomake
let g:neomake_elixir_enabled_makers = ['mycredo']
function! NeomakeCredoErrorType(entry)
    if a:entry.type ==# 'F'      " Refactoring opportunities
        let type = 'W'
    elseif a:entry.type ==# 'D'  " Software design suggestions
        let type = 'I'
    elseif a:entry.type ==# 'W'  " Warnings
        let type = 'W'
    elseif a:entry.type ==# 'R'  " Readability suggestions
        let type = 'I'
    elseif a:entry.type ==# 'C'  " Convention violation
        let type = 'W'
    else
        let type = 'M'           " Everything else is a message
    endif
    let a:entry.type = type
endfunction
let g:neomake_elixir_mycredo_maker = {
      \ 'exe': 'mix',
      \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
      \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
      \ 'postprocess': function('NeomakeCredoErrorType')
      \ }
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
  au FileType elm nn K :ElmShowDocs<CR>
  au FileType elm nn <localleader>m :ElmMake<CR>
  au FileType elm nn <localleader>r :ElmRepl<CR>
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

set background=dark
colo off
" hi TabLine ctermfg=darkGrey
" hi TabLineSel ctermfg=lightBlue

"===================================FAST=SEARCH=================================

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  call denite#custom#var('file_rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

"===================================KEYBINDINGS=================================
map <leader><leader> <Plug>(easymotion-overwin-f)
map  / <Plug>(easymotion-sn)
om / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nn <leader>bb :Denite buffer<CR>
nn <leader>bh :bN<CR>
nn <leader>bl :bn<CR>
nn <leader>d :Dirvish %<CR>
nn <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nn <leader>f :Denite file_rec<CR>
nn <leader>g :Gstatus<CR>
nn <leader>h :h<Space>
nn <leader>j <C-]>
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
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
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
imap <silent> <expr> <C-E>
      \ neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" :
      \ "\<C-E>"

" Autoreload .vimrc
au! bufwritepost .vimrc source %
au! bufwritepost .lvimrc source %

