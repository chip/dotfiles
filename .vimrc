" Basic settings ---------------------- {{{
  syntax enable
  filetype plugin on
  set viminfo='20,<50,s10 " Improve startup time
  set clipboard=exclude:.*
  set nowrap
  set linebreak " display with line break, but don't change formatting
  set expandtab " use spaces, not tabs (optional)
  set tabstop=2 " a tab is two spaces (or set this to 4)
  set shiftwidth=2
  set softtabstop=2
  set autoindent
  set smartindent
  set backspace=indent,eol,start " backspace through everything in insert mode
  set formatoptions+=1 " format options
  set incsearch " searching
  set smartcase
  set nohlsearch " highlight matches
  set number relativenumber " show line numbers
  set ruler " show the cursor position all the time
  set autoread " auto-reload buffers when file changed on disk
  set updatetime=50
  set nobackup
  set noswapfile
  set rtp+=/usr/local/opt/fzf " runtimepath for plugins
  set rtp+=~/.vim/pack/default/start/tabnine-vim
  set cursorline " highlight the line of the cursor
  set background=dark
  colorscheme apprentice
" }}}

" Mappings  ---------------------- {{{
  let mapleader=","
  " go back to the previous buffer
  nnoremap <leader><leader> <c-^>
  " shortcuts for saving, quitting, and exiting a file
  noremap <leader>w :w<CR>
  noremap <leader>q :q<CR>
  noremap <leader>x :wq<CR>
  " remapping escape
  inoremap jk <esc>
  " remove search highlighting
  nnoremap <esc> :noh<CR>
" }}}

" fzf key settings ---------------------- {{{
  noremap <leader>f :GFiles<CR>
  noremap <leader>i :Files<CR>
  noremap <leader>b :Buffers<CR>
" }}}

" Testing shortcuts ---------------------- {{{
  nnoremap <silent> <leader>t :TestNearest<CR>
  nnoremap <silent> <leader>T :TestFile<CR>
  nnoremap <silent> <leader>A :TestSuite<CR>
  let test#vim#term_position = 'vert'
  let g:test#strategy = 'vimterminal'
" }}}

" Buffer navigation ---------------------- {{{
" remap buffer navigation per tip #35 of Practical Vim.
" (:bprevious & :bnext use custom mappings, though)
  nnoremap <silent> P :bprevious<CR>
  nnoremap <silent> N :bnext<CR>
  nnoremap Q :bd<CR> " close current buffer
" }}}

" Search configuration ---------------------- {{{
  nnoremap K :Rg<SPACE><CR>
  nnoremap <leader>a :Rg<SPACE>
" }}}

" Miscellaneous ---------------------- {{{
  " Move selected text
  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv

  " Fold settings
  set foldmethod=indent
" }}}
