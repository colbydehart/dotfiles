"====================GENERAL====================== 
"=================================================
set encoding=utf-8              "UTF8
set t_Co=256                    "Colors
colo xoria256                   "Colorscheme
set guifont=PT\ Mono:h18        "Beautiful beautiful fonts
set ruler                       "Show the line and column in bottom right
set mouse=a                     "Use the mouse for resizing windows
set number                      "Show line numbers
set ls=2                        "Show status line
set expandtab                   "Spaces, no tabs
set backspace=2                 "Make backspacing work in insert
set tabstop=4                   "4 spaces per tab
set shiftwidth=4                "4 spaces for autoindent
set autoindent                  "Set new line to previous line indent
set autoread                    "Update files on change
set smartindent                 "Automatically indent
set nobackup                    "No backups!
set visualbell                  "No sounds!
set noswapfile                  "No swaps!
set wildmenu                    "Tab autocomplete commands

if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

:let mapleader = ","            "Leader is comma
"Changes parenthesis matching colors
hi MatchParen gui=bold cterm=bold ctermbg=none ctermfg=magenta guibg=#00ff99 guifg=#000000
"folding settings
set foldenable
set foldmethod=indent
set foldlevelstart=20

"====================FUNCTION======================
"=================================================
au BufRead todo.md exe "call Todo()"
function Todo()
    set foldlevel=0
    nmap <leader>c :s/^\[\s/[x/<CR>
    nmap <leader>i :s/^\[x/[ /<CR>
    nmap <leader>t :s/^/[ ] /<CR>
endfunction

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"====================IGNORE======================
"=================================================
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=.git
set wildignore+=.venv
"====================PLUGINS======================
"=================================================
"Set up Plugin stuff
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/vimproc.vim'
" Indentation && gutter plugins 
Plugin 'myusuf3/numbers.vim'
let g:numbers_exclude = ['nerdtree']
"Sets my pretty indentation bars and their colors
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#555555 ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#666666 ctermbg=235


" Searching/Navigation
Plugin 'scrooloose/nerdtree'
let g:NERDTreeRespectWildIgnore=1
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'

" Small utility plugins
Plugin 'Lokaltog/vim-easymotion'
hi EasyMotionTarget ctermbg=cyan ctermfg=black
hi EasyMotionShade  ctermbg=cyan ctermfg=black
hi EasyMotionTarget2First ctermbg=cyan ctermfg=yellow
hi EasyMotionTarget2Second ctermbg=lightblue ctermfg=yellow

map <Leader> <Plug>(easymotion-prefix)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
:let g:EasyMotion_keys='arstdhneioqwfpgjluy;zxcvbkm'
hi link EasyMotionTarget Cursor
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Raimondi/delimitMate'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
let g:session_autosave='no'
let g:session_autoload='no'
Plugin 'rizzatti/dash.vim'

" Apparently a shrine to tpope
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'mileszs/ack.vim'

" Additional Syntax
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'pearofducks/ansible-vim'
au BufRead *.twig set filetype=html
au BufRead *.md set filetype=markdown
Plugin 'nelstrom/vim-markdown-folding'
let g:markdown_fold_style='nested'

" Enable omnicompletion
Plugin 'ervandew/supertab'
Plugin 'klen/python-mode'
Plugin 'm2mdas/phpcomplete-extended'
let g:SuperTabDefaultCompletionType = '<C-Tab>'
Plugin 'mattn/emmet-vim'
Plugin 'xsbeats/vim-blade'
Plugin 'rodjek/vim-puppet'
Plugin 'elixir-lang/vim-elixir'
Plugin 'shawncplus/phpcomplete.vim'
Plu<t_ü>    
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" Snippets
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
" Syntax linting
Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_php_checkers = ["php"]
let g:syntastic_python_checkers = ["flake8"]
" Debug
Plugin 'joonty/vdebug'
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000
let g:vdebug_options["break_on_open"] = 0
call vundle#end()            " required

filetype plugin indent on    " required
syntax on
"====================KEYMAPPING===================
"=================================================
"Remapping for moving lines with gj or gk
nnoremap gj :m .+1<CR>
nnoremap gk :m .-2<CR>

"Easy save
nnoremap <leader>w :w!<CR>

" Easy escape
imap <C-c> <ESC>

" Easy window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Easy tab navigation
nnoremap H gT
nnoremap L gt

" Dash lookup mapping to 'gd'
:nnoremap gd :Dash<CR>

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>a :TagbarToggle<CR>


"Local Vimrc
if filereadable("./.lvimrc")
    execute "source ./.lvimrc"
endif

"Autoreload vimrc
autocmd! bufwritepost .vimrc source %
