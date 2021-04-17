colorscheme apprentice
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
set rtp+=/usr/local/opt/fzf " runtimepath for plugins
set shiftwidth=2
set smartcase
set smartindent
set softtabstop=2
set tabstop=2
set updatetime=50
let g:python_host_prog = "/usr/bin/python"
let g:python3_host_prog = "/usr/local/bin/python3"
let mapleader=","
nnoremap <leader>t :vnew term://npm run test<CR>
let g:ale_disable_lsp = 0
let g:ale_sign_column_always = 1
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
" " go back to the previous buffer
nnoremap <leader><leader> <c-^>
nnoremap - :e.<CR>
noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
noremap <leader>x :wq<CR>
inoremap jk <esc>
nnoremap <leader>/ :noh<CR>
noremap <leader>f :GFiles<CR>
noremap <leader>i :Files<CR>
noremap <leader>b :Buffers<CR>
nnoremap <silent> P :bprevious<CR>
nnoremap <silent> N :bnext<CR>
nnoremap Q :bd!<CR>
nnoremap K :Rg<SPACE><CR>
nnoremap <leader>a :Rg<SPACE>
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
" Use <cr> for selecting snippet
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
