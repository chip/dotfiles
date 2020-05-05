syntax enable
filetype plugin on
set viminfo='20,<50,s10 " Improve startup time
set clipboard=exclude:.*
set nowrap
set expandtab " use spaces, not tabs (optional)
set tabstop=2 " a tab is two spaces (or set this to 4)
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set backspace=indent,eol,start " backspace through everything in insert mode
set incsearch " searching
set smartcase
set nohlsearch " highlight matches
set number relativenumber " show line numbers
set ruler " show the cursor position all the time
set autoread " auto-reload buffers when file changed on disk
set updatetime=50
set nobackup
set noswapfile
set foldmethod=indent " Fold settings
set rtp+=/usr/local/opt/fzf " runtimepath for plugins
set rtp+=~/.vim/pack/default/start/tabnine-vim
set background=dark
colorscheme apprentice
let mapleader=","
let g:test#strategy = 'vimterminal'
" go back to the previous buffer
nnoremap <leader><leader> <c-^>
noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
noremap <leader>x :wq<CR>
inoremap jk <esc>
nnoremap <esc> :noh<CR>
noremap <leader>f :GFiles<CR>
noremap <leader>i :Files<CR>
noremap <leader>b :Buffers<CR>
nnoremap <silent> P :bprevious<CR>
nnoremap <silent> N :bnext<CR>
nnoremap Q :bd<CR>
nnoremap K :Rg<SPACE><CR>
nnoremap <leader>a :Rg<SPACE>
" Move selected text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
