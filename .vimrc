colorscheme apprentice
set clipboard+=unnamedplus
set expandtab
set foldlevel=2
set foldmethod=indent
set foldnestmax=10
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
let g:test#strategy = 'vimterminal'
" go back to the previous buffer
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
nnoremap Q :bd<CR>
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
