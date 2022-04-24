set number 
set numberwidth=1
set mouse=r
set clipboard=unnamed
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
syntax enable
set tabstop=2
set autoindent
set laststatus=2
set bg=dark
set guifont=fira_code

call plug#begin('~/.local/share/nvim/plugged')

" Themes 
Plug 'morhetz/gruvbox'
Plug 'frazrepo/vim-rainbow'

" Status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" Javascript | React js
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" Install coc for prettier and autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" IDE 
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'yggdroot/indentline'
 
 
call plug#end()

" Theme config and vim-rainbow config
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
let NERDTreeQuitOnOpen=1
au FileType js,objc call rainbow#load()
let mapleader=" "

nmap <Leader>nt :NERDTreeFind<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" Prettier config
nmap <C-f> <Plug>(coc-format-selected)<CR>
