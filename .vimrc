" Configuration inspired by http://mislav.uniqpath.com/2011/12/vim-revisited/

" choose no compatibility with legacy vi
set nocompatible

" Vundle settings
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'janko-m/vim-test'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'tpope/vim-surround'

filetype plugin indent on
call vundle#end()

set encoding=utf-8
set fileformat=unix
syntax enable
setlocal spell spelllang=en_us 

" wrap lines
set wrap

" display with line break, but don't change formatting
set linebreak

" note trailing space at end of next line
set showbreak=>\ \ \

" use spaces, not tabs (optional)
set expandtab

" a tab is two spaces (or set this to 4)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" backspace through everything in insert mode
set backspace=indent,eol,start

" text width
set tw=72

" format options
set fo+=1

" searching
set incsearch

" searches are case insensitive...
set ignorecase

" ...unless they contain at least one capital letter
set smartcase

" highlight matches
set hlsearch

" show line numbers
set number

" show the cursor position all the time
set ruler

" highlight the line of the cursor
set cursorline

" display incomplete commands
set showcmd

" use zsh
set shell=/usr/local/bin/zsh

" remember more Ex commands
set history=200

" have some context around the current line always on screen
set scrolloff=2

" auto-reload buffers when file changed on disk
set autoread
set nobackup
set noswapfile

" Use the quotestar register for all yank, delete, change and put
" operations that have no register explicitly specified:
" http://vimcasts.org/episodes/accessing-the-system-clipboard-from-vim/
set clipboard=unnamed

" runtimepath for plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/ag

" only if there are at least 2 windows
set laststatus=1

" Bootstrap autocomplete
set dictionary+=~/.vim/bundle/bootstrap-snippets/dictionary

" autocompletion should use keywords from dictionary
set complete+=k

" enable per-directory .vimrc files
set exrc

" disable unsafe commands in local .vimrc files
set secure

" menu for autocompletion
set wildmenu
set wildmode=longest:list,full

" set buffer background
set background=dark

" set buffer colorscheme
colorscheme railscasts

" file suffixes to search when using gf to find a file
set suffixesadd+=.js,.rb

" map the leader key to a comma instead of a backslash
let mapleader=","

" go back to the previous buffer
nnoremap <leader><leader> <c-^>

" shortcut for saving a file
map <leader>w :w<CR>

" shortcut for quitting a file
map <leader>q :q<CR>

" shortcut for saving and quitting a file
map <leader>x :wq<CR>

" remapping escape
inoremap jk <esc>
inoremap <esc> <nop>

" edit .vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>

" save .vimrc and source it
nnoremap <leader>sv :w\|:source $MYVIMRC<cr>

" edit .zshrc
nnoremap <leader>zsh :e ~/.zshrc<cr>

" remove unnecessary spaces before writing files
autocmd FileType javascript,coffee,html,css,less,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

" set file types when opening or creating a file
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.jsx set filetype=javascript
au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile *.css set filetype=css
au BufRead,BufNewFile *.less set filetype=css

" janko-m/vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>A :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "basic"
let test#javascript#jasmine#executable = 'node_modules/.bin/babel-node node_modules/.bin/jasmine'

" remap buffer navigation per tip #35 of Practical Vim
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Ctrl-P mapping is overwritten
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 40
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_new_file = 'v'
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

" map for running Ag plugin
nnoremap <leader>a :Ag<SPACE>

" folding
set foldmethod=expr
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
  let g:syntastic_javascript_checkers = ['eslint']

  let g:syntastic_error_symbol = '❌'
  let g:syntastic_style_error_symbol = '⁉️'
  let g:syntastic_warning_symbol = '⚠️'
  let g:syntastic_style_warning_symbol = '💩'

  highlight link SyntasticErrorSign SignColumn
  highlight link SyntasticWarningSign SignColumn
  highlight link SyntasticStyleErrorSign SignColumn
  highlight link SyntasticStyleWarningSign SignColumn
endif

" For Javascript autocompletion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" For Ruby autocompletion
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Per Wincent:
" https://github.com/wincent/wincent/commit/0664b627e7390c7ab5b047ee5818801481d0f46c

" YouCompleteMe and UltiSnips compatibility.
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'

" TODO: change UltiSnips to not try mapping if this is empty; setting this to
" <C-k> here rather than <S-Tab> to prevent it from getting clobbered in:
" ultisnips/pythonx/UltiSnips/snippet_manager.py: _map_inner_keys
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

let g:ycm_key_list_select_completion = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:ulti_jump_forwards_res = 0
let g:ulti_expand_res = 0

augroup WincentAutocomplete
  autocmd!

  " Override late bindings set up by YouCompleteMe in autoload file.
  autocmd BufEnter * exec 'inoremap <silent> <Tab> <C-R>=autocomplete#expand_or_jump("N")<CR>'
  autocmd BufEnter * exec 'inoremap <silent> <S-Tab> <C-R>=autocomplete#expand_or_jump("P")<CR>'

  " TODO: ideally would only do this while snippet is active
  " (see pythonx/UltiSnips/snippet_manager.py; might need to open a feature
  " request or a PR to have _map_inner_keys, _unmap_inner_keys fire off
  " autocommands that I can subscribe to)
  " BUG: seems you have to do <CR> twice to actual finalize completion
  " (this happens even with the standard <C-Y>
  inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "<CR>"
augroup END

" Additional UltiSnips config
let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = ['ultisnips']

" Additional YouCompleteMe config
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
