set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/Cpp11-Syntax-Support'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdcommenter'
Plugin 'evidens/vim-twig'
Plugin 'vim-scripts/AutoTag'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/AutoClose'
Plugin 'joonty/vdebug.git'
Plugin 'xsbeats/vim-blade'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'edsono/vim-matchit'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


set backspace=indent,eol,start

set autoindent
set autowrite
set nobomb
set cuc
set cul
set expandtab
set history=50
set hls
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set number
set ruler
set scrolloff=5
set shiftwidth=4
set showcmd
set showmatch
set sidescroll=5
set showtabline=2
set smartcase
set smartindent
set smarttab
"set softtabstop=4
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
set t_Co=256
set tabstop=4
set textwidth=0
set title
set visualbell
set wildmenu
set wildmode=longest,list,full
set wmh=0

if $TMUX!=""
	set term=screen-256color
else
	set term=xterm-256color
endif

let mapleader = ","

filetype plugin on

syntax on

"colorscheme jellybeans

let g:hybrid_use_Xresources = 1
colorscheme hybrid

let c='a'
while c <= 'z'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
 endw

set timeout ttimeoutlen=50

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

nnoremap <C-v> <Esc>:set paste<Return>
nnoremap <C-b> <Esc>:set nopaste<Return>

nnoremap <C-h> :tabprevious <Return>
nnoremap <C-l> :tabnext <Return>
inoremap <C-h> <Esc>:tabprevious <Return>
inoremap <C-l> <Esc>:tabnext <Return>

nnoremap <C-x> :set autoread <Return> :checktime <Return>
inoremap <C-x> :set autoread <Return> :checktime <Return>

nnoremap <silent> ,t :CtrlP<CR>
nnoremap <silent> ,p :NERDTreeTabsToggle<CR>

nnoremap ü <C-]>
nnoremap Ü <C-O>

"Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"Syntastic && YCM
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall'
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_specific_completion_to_disable = {'java': 1}
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_cache_omnifunc = 1


let g:vdebug_options = {
\   'path_maps': {
\       "/www/": "/home/adrian/beyond/itown/",
\   },
\   'server': "",
\   'port': "9000",
\}

let &titleold=getcwd()

let g:NERDTreeWinSize = 40 

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

au BufNewFile,BufRead *.less set filetype=less

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.tml set filetype=html

    autocmd BufRead,BufNewFile *.module set expandtab
    autocmd BufRead,BufNewFile *.module set tabstop=2
    autocmd BufRead,BufNewFile *.module set shiftwidth=2
    autocmd BufRead,BufNewFile *.module set autoindent
    autocmd BufRead,BufNewFile *.module set smartindent

    autocmd BufRead,BufNewFile *.inc set expandtab
    autocmd BufRead,BufNewFile *.inc set tabstop=2
    autocmd BufRead,BufNewFile *.inc set shiftwidth=2
    autocmd BufRead,BufNewFile *.inc set autoindent
    autocmd BufRead,BufNewFile *.inc set smartindent

    autocmd BufRead,BufNewFile *.install set expandtab
    autocmd BufRead,BufNewFile *.install set tabstop=2
    autocmd BufRead,BufNewFile *.install set shiftwidth=2
    autocmd BufRead,BufNewFile *.install set autoindent
    autocmd BufRead,BufNewFile *.install set smartindent

  augroup END
endif

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

