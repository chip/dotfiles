colorscheme nord
set clipboard+=unnamedplus
set expandtab
set foldlevel=99
set foldmethod=indent
set foldcolumn=1
set nowrap
set nobackup
set noswapfile
set number
set relativenumber
set shiftwidth=2
set smartcase
set smartindent
set softtabstop=2
set tabstop=2
set updatetime=50
let g:python_host_prog = "/usr/bin/python"
let g:python3_host_prog = "/usr/local/bin/python3"
nnoremap <leader>tt :new term://npm run test<CR>
" go back to the previous buffer
nnoremap <leader><leader> <c-^>
nnoremap - :e.<CR>
noremap <leader>w :w<CR>
noremap <leader>q :bd!<CR>
noremap <leader>x :wq<CR>
inoremap jk <esc>
nnoremap <leader>/ :noh<CR>
