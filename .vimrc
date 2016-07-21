" Configuration inspired by http://mislav.uniqpath.com/2011/12/vim-revisited/
set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set fileformat=unix

syntax enable
setlocal spell spelllang=en_us 

" Whitespace
set wrap
set linebreak
set showbreak=>\ \ \  " note trailing space at end of next line
set expandtab         " use spaces, not tabs (optional)
set shiftwidth=2      " a tab is two spaces (or set this to 4)
set softtabstop=2     " a tab is two spaces (or set this to 4)
set autoindent
set smartindent
set backspace=indent,eol,start  " backspace through everything in insert mode
set tw=72
set fo+=1
"" Searching
set incsearch  " incremental searching
set ignorecase " searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter
set hlsearch   " highlight matches
:nmap \q :nohlsearch<CR>
set number      " show line numbers
set ruler       " show the cursor position all the time
set cursorline  " highlight the line of the cursor
set showcmd     " display incomplete commands
set shell=/usr/local/bin/zsh
set history=200 " remember more Ex commands
set scrolloff=3 " have some context around the current line always on screen
set autoread    " Auto-reload buffers when file changed on disk
set nobackup
set noswapfile
set clipboard=unnamed
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/ag
set laststatus=1
set dictionary+=~/.vim/bundle/bootstrap-snippets/dictionary " Bootstrap autocomplete
set complete+=k
set exrc " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files
set wildmenu
set wildmode=longest:list,full
set background=dark

colorscheme railscasts

let mapleader=","

nnoremap <leader><leader> <c-^>

map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>x :wq<CR>

" Remapping escape
inoremap jk <esc>
inoremap <esc> <nop>

" .vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :w\|:source $MYVIMRC<cr>
nnoremap <leader>zsh :e ~/.zshrc<cr>

" Remove unnecessary spaces before writing files
autocmd FileType js,coffee,html,css,less,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile *.jsx set filetype=javascript
au BufRead,BufNewFile *.css set filetype=css
au BufRead,BufNewFile *.less set filetype=css

" janko-m/vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "basic"

" Remap buffer navigation per tip #35 of Practical Vim
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Ctrl-P mapping is overwritten
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 40
let g:ctrlp_custom_ignore = 'tmp\|log\|public\|vendor/assets\|vendor/bundle\|vendor/plugins\|spec/cassett\|\.git\|cassett\|/.git\|/app/assets/image\|/coverage\|public/*\.js\|node_modules'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPBufTag<CR>

" https://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ag_prg="/usr/local/bin/ag --vimgrep"

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <leader>a :Ag<SPACE>

" folding
set foldmethod=manual
nnoremap <Space> za

" Syntastic
if !empty(globpath(&rtp, "./plugin/syntastic.vim"))
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_loc_list_height = 5
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 1
  let g:syntastic_javascript_checkers = ['eslint', 'gjshint', 'jshint']

  let g:syntastic_error_symbol = '❌'
  let g:syntastic_style_error_symbol = '⁉️'
  let g:syntastic_warning_symbol = '⚠️'
  let g:syntastic_style_warning_symbol = '💩'

  highlight link SyntasticErrorSign SignColumn
  highlight link SyntasticWarningSign SignColumn
  highlight link SyntasticStyleErrorSign SignColumn
  highlight link SyntasticStyleWarningSign SignColumn
endif

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'janko-m/vim-test'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kchmck/vim-coffee-script'

filetype plugin indent on
call vundle#end()

" Status bar
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
