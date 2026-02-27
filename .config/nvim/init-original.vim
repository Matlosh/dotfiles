set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list
set cc=80
filetype plugin indent on
syntax on
set mouse=a
set clipboard=unnamedplus
filetype plugin on
set cursorline
set ttyfast

call plug#begin("~/.vim/plugged")
"Plug 'dracula/vim'
"Plug 'ryanoasis/vim-devicons'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'scrooloose/nerdtree'
"Plug 'preservim/nerdcommenter'
"Plug 'mhinz/vim-startify'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/Shougo/denite.nvim'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }

call plug#end()

colorscheme hybrid

"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-j> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

let g:NERDTreeDirArrowExpandable = '~'
let g:NERDTreeDirArrowCollapsible = '+'
