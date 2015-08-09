"====================GENERAL====================== 
"=================================================
set encoding=utf-8              "UTF8
set t_Co=256                    "Colors
colo sourcerer                     "Colorscheme
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

:let mapleader = ","            "Leader is comma
"Changes parenthesis matching colors
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta    
"folding settings
set foldenable
set foldmethod=indent
set foldlevelstart=20

"Don't let debugger stop
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

" Zeal lookup mapping to 'gz'
:nnoremap gz :silent !zeal --query <cWORD> <CR><CR>

nmap <leader>n :NERDTreeToggle<CR>
nmap <C-p> :Unite file_rec<CR>
"====================FUNCTIONS======================
"=================================================
"Local Vimrc
if filereadable("./.lvimrc")
    execute "source ./.lvimrc"
endif
"====================PLUGINS======================
"=================================================
"Set up NeoBundle stuff
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Indentation && gutter plugins 
NeoBundle 'myusuf3/numbers.vim'
let g:numbers_exclude = ['nerdtree']
"Sets my pretty indentation bars and their colors
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=235


" Searching/Navigation
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
"
" Small utility plugins
NeoBundle 'Lokaltog/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
:let g:EasyMotion_keys='arstdhneioqwfpgjluy;zxcvbkm'
NeoBundle 'christoomey/vim-tmux-navigator'

NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-abolish'

" Additional Syntax
au BufRead *.md set filetype=markdown

"Completions for filetypes
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


call neobundle#end()

filetype plugin indent on
syntax on

NeoBundleCheck

