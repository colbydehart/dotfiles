"===============================COLBY=DEHART'S================================
"==================================WONDERFUL===================================
"===================================HORRIBLE===================================
"====================================VIMRC=====================================
"==============================================================================
"===================================GENERAL====================================
set clipboard=unnamedplus          "use system clipboard
set hidden                         "allow jumping back and forth between multiple unsaved buffers
set ignorecase                     "ignore case when searching
set wildignorecase                 "case insensitive file search
set number
set relativenumber
set foldmethod=syntax
set foldlevel=99
let mapleader = ' '                "leader is space
let maplocalleader = ','           "localleader is comma
let g:python3_host_prog = "~/.config/nvim/venv/bin/python"
"" -- NetRW
let g:netrw_banner = 0             "no banner
let g:netrw_browse_split = 4       "open netrw files in other window
let g:netrw_winsize = 35           "25 column width for netrw
let g:netrw_altv = 1               "Vertical split on right side
let g:netrw_browsex_viewer="open"  "open stuff with open

""===================================IGNORE======================================
set wildignore+=*/_build
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=.git
set wildignore+=.venv
set wildignore+=*.bs.js
set wildignore+=.DS_Store

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
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'mechatroner/rainbow_csv'
Plug 'liuchengxu/vim-which-key' 


"====================================UTILITY====================================
Plug 'jiangmiao/auto-pairs'
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
Plug 'tpope/vim-sensible' " good defaults
Plug 'sheerun/vim-polyglot'
let g:AutoPairsMapCR = 0
au! FileType fugitive nm <buffer> <TAB> =

"==================================NAVIGATION===================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
let g:sneak#use_ic_scs = 1
let g:sneak#label = 1
let g:fzf_preview_window = []

"==================================AUTOCOMPLETION===============================
Plug 'neoclide/coc.nvim'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories = [$HOME.'/dotfiles/snippets']
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:coc_disable_transparent_cursor=1

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-git',
      \ 'coc-pyright',
      \ 'coc-elixir',
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-eslint',
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
au! BufEnter .babelrc setlocal ft=json
au! BufEnter .prettierrc setlocal ft=json
au! BufEnter .eslintrc setlocal ft=json
au! BufEnter *.postcss,*.pcss setlocal ft=postcss

"=================================CLOJURE=======================================
Plug 'liquidz/vim-iced'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
let g:iced_enable_default_key_mappings = v:true
  let g:iced_default_key_mapping_leader = '<localleader>'
augroup clojure
  au! FileType clojure,clojurescript nn gd :IcedDefJump<CR>
  au! FileType clojure,clojurescript nn gr :IcedBrowseReferences<CR>
augroup END


"===================================ETC.========================================
Plug 'editorconfig/editorconfig-vim'
Plug 'neo4j-contrib/cypher-vim-syntax' " neo4j cypher syntax
Plug 'sotte/presenting.vim'

"=================================PLUG END======================================
call plug#end()
set background=dark
let g:lightline = {'colorscheme': 'PaperColor'}
colo PaperColor
filetype plugin indent on
syntax enable

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
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nn <leader>' :Marks<CR>
nn <leader>/ :Rg<CR>
nn <leader>; :Commands<CR>
nn <leader><CR> :
nn <leader><leader> :b#<CR>
" nn <leader>a TODO
nn <leader>b :Buffers<CR>
nn <leader>c :Lines<CR>
nn <leader>d :Vexplore! .<CR>
nn <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nn <leader>f :Files<CR>
nn <leader>g :Git<CR>
nn <leader>h :Helptags<CR>
nn <leader>i :Tags<CR>
nn <silent> <leader>jc :call CondenseLog()<CR>
nn <silent> <leader>jl :call OpenLog()<CR>
nn <silent> <leader>jj :FZF ~/notes<CR>
nn <silent> <leader>js :e ~/notes/scratch.md<CR>
nn <silent> <leader>jt :e ~/notes/todo.txt<CR>
nn <leader>k :q<CR>
nmap <leader>ln <Plug>(coc-diagnostic-next-error)
nn <leader>ll :CocDiagnostics<CR>
nmap <leader>lp <Plug>(coc-diagnostic-prev-error)
nn <leader>m :History<CR>
nn <leader>n :tabe<CR>
" nn <leader>o TODO
nn <leader>p :cw<CR>
nn <leader>q :qa<CR>
nn <leader>ra :%s/
nn <leader>rr :s/
nn <leader>sh :vsplit<CR>
nn <leader>sj :split<CR><C-W>j
nn <leader>sk :split<CR>
nn <leader>sl :vsplit<CR><C-W>l
nn <silent> <leader>t :call OpenOrCreateTerminal()<CR>
" nn <silent> <leader>u  TODO
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
    setlocal foldlevel=1
  endif
endfunction
nn <leader>z :call ToggleFold()<cr>

" Window navigation
nn <C-j> <C-W>j
nn <C-k> <C-W>k
nn <C-h> <C-W>h
nn <C-l> <C-W>l


" Arrows resize
nn <Left> :vertical res -5<CR>
nn <Right> :vertical res +5<CR>
nn <Up> :res +5<CR>
nn <Down> :res -5<CR>

" Etc. keymappings
nn - :Vexplore!<CR>
nn Q @q
nn / /\v
nn ? ?\v
nn H gT
nn L gt
nn ! :!
nn q: :q
nn Z zA
im <C-c> <ESC>
nn <BS> :bp<CR>

" Terminal stuff
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
au TermOpen * setlocal nonumber norelativenumber bufhidden=hide

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
inoremap <silent><expr> <C-Space> coc#refresh()

" Local Vimrc
if filereadable('./.lvimrc')
  exec 'source ./.lvimrc'
endif

" Autoreload .vimrc
au! bufwritepost init.vim source %
au! bufwritepost .lvimrc source %
