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
set wrap!
let mapleader="q"

call plug#begin('~/.local/share/nvim/plugged')

" Themes 
Plug 'morhetz/gruvbox'
Plug 'frazrepo/vim-rainbow'


" Plug Javascript | React
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'

" Plug autocomplete with coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'


" Discord
"Plug 'vimsence/vimsence'
"Plug 'anned20/vimsence'
"Plug 'aurieh/discord.nvim'
Plug 'stoozy/vimcord'

" IDE 
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'yggdroot/indentline'


" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


"IDE | GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
" GIT COPILOT
Plug 'github/copilot.vim'

"IDE | Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"IDE | icons
Plug 'ryanoasis/vim-devicons'

"Degub
Plug 'vim-vdebug/vdebug'
"Docker
Plug 'kkvh/vim-docker-tools'

"Format php
Plug 'yaegassy/coc-blade-formatter', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intelisense
Plug '2072/php-indenting-for-vim'
Plug 'mhartington/formatter.nvim'


call plug#end()
"Discord config
" General options
let g:vimsence_client_id = '439476230543245312'
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
"let g:vimsence_custom_icons = {'filetype': 'iconname'}



" Theme config and vim-rainbow config and mxw/vim-jsx
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
let g:jsx_ext_required = 1
let NERDTreeQuitOnOpen=1
au FileType js,objc call rainbow#load()
let mapleader=" "

nmap <Leader>nt :NERDTreeFind<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-a> :Copilot panel<CR>
inoremap <silent><expr> <c-space> coc#refresh()
" Integration Bar | name of the brach
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Close tag config
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_xhtml_filetypes = '*.xhtml,*.jsx,*.js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" xdebug
let g:vdebug_options = {}
let g:vdebug_options["port"] = 7000


" options format
let g:PHP_autoformatcomment = 1
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-phpls',
    \ 'coc-python',
	\ 'coc-diagnostic'
    \]

" Git config
nnoremap <C-s> :lua require('telescope.builtin').git_status()<Cr>
nnoremap <C-b> :lua require('telescope.builtin').git_branches()<Cr>
nnoremap <C-t> :Git fetch --all -p<Cr>
nnoremap <C-p> :Git pull<Cr>
let g:blamer_enabled = 1

" Telescope config
nnoremap <silent> ;; <Cmd>Telescope find_files<CR>
nnoremap <silent> ;r <Cmd>Telescope live_grep<Cr>
nnoremap <silent> \\ <Cmd>Telescope buffers<Cr>
nnoremap <silent> ;f <Cmd>Telescope help_tags<Cr>


" lua Telescope config
lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup {
	defaults = {
		mappings = {
			n= {
					["q"] = actions.close
				},
			},					

		}
	}
EOF

" Prettier config
nnoremap <C-f> :CocCommand prettier.formatFile <Cr>
