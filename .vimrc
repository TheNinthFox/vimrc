set nocompatible			" required
filetype off				" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"" Plugins
Plugin 'tmhedberg/SimpylFold'						" Folding
Plugin 'vim-scripts/indentpython.vim'					" Indentation
Plugin 'Valloric/YouCompleteMe'						" AutoComplete
Plugin 'scrooloose/syntastic'						" Syntax Highlighting
Plugin 'nvie/vim-flake8'						" PEP8 checking
Plugin 'jnurmine/Zenburn'						" Colorscheme
Plugin 'kien/ctrlp.vim'							" Ctrl-P Find all
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}		" Powerline

" Plugins must be added before these lines
call vundle#end()			" required
filetype plugin indent on		" required



"" Settings

" Colorscheme
colorscheme zenburn

" Line numbers
set number

" Split settings
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

" Always show statusbar
set laststatus=2

" Misc
set encoding=utf-8
let python_highlight_all=1
syntax on



" Plugin settings
let g:SimpylFold_docstring_preview=1				" Folding
let g:ycm_autoclose_preview_window_after_completion=1		" YCM preview window
let g:Powerline_symbols = 'fancy'				" Powerline



"" Keybinds

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Folding
nnoremap <space> za

" YCM
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>



"" Formatting

" Python
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix


" Flag & remove unnecessary whitespaces
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" Python with virtualenv support
python << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
  EOF
