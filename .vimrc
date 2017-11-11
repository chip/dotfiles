" Not compatible with vi ---------------------- {{{
" choose no compatibility with legacy vi
set nocompatible
" }}}

" Plugins ---------------------- {{{
" See ~/.vim/pack/bundle/start for current list
" Install, update or remove plugins using basic unix commands from there

" Basic settings ---------------------- {{{
set encoding=utf-8
set fileformat=unix
syntax enable
setlocal spell spelllang=en_us 
filetype plugin on

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
set textwidth=72

" format options
set formatoptions+=1

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
set laststatus=2

" set status line
set statusline=%.50F      " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines

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

colorscheme hybrid_material
let g:enable_bold_font = 1

" file suffixes to search when using gf to find a file
set suffixesadd+=.js,.rb
" }}}

" Mappings  ---------------------- {{{
" map the leader key to a comma instead of a backslash
let mapleader=","

" go back to the previous buffer
nnoremap <leader><leader> <c-^>

" shortcut for saving a file
noremap <leader>w :w<CR>

" shortcut for quitting a file
noremap <leader>q :q<CR>

" shortcut for saving and quitting a file
noremap <leader>x :wq<CR>

" remapping escape
inoremap jk <esc>
inoremap <esc> <nop>

" edit .vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>

" save .vimrc and source it
nnoremap <leader>sv :w\|:source $MYVIMRC<cr>

" edit .zshrc
nnoremap <leader>zsh :e ~/.zshrc<cr>
" }}}

" FileType settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup remove_spaces
    autocmd!
    autocmd FileType javascript,vue,coffee,html,css,less,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END

augroup set_markdown
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
augroup END

augroup set_html
    autocmd!
    autocmd BufRead,BufNewFile *.html set filetype=html
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType html setlocal foldmethod=indent
augroup END

augroup set_javascript
    autocmd!
    autocmd BufRead,BufNewFile *.js set filetype=javascript
    autocmd BufRead,BufNewFile *.es6 set filetype=javascript
    autocmd BufRead,BufNewFile *.jsx set filetype=javascript
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript setlocal foldmethod=indent
augroup END

augroup set_vue
    autocmd!
    autocmd BufRead,BufNewFile *.vue set filetype=vue
    autocmd FileType vue set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType vue syntax sync fromstart
    autocmd FileType vue setlocal foldmethod=indent
augroup END

augroup set_coffee
    autocmd!
    autocmd BufRead,BufNewFile *.coffee set filetype=coffee
    autocmd FileType coffee set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType coffee setlocal foldmethod=indent
augroup END

augroup set_css
    autocmd!
    autocmd BufRead,BufNewFile *.css set filetype=css
    autocmd BufRead,BufNewFile *.less set filetype=css
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
augroup END

augroup set_ruby
    autocmd!
    autocmd BufRead,BufNewFile *.rb set filetype=ruby
    autocmd FileType ruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby let g:rubycomplete_rails = 1
    autocmd FileType ruby let g:rubycomplete_classes_in_global = 1
augroup END
" }}}

" Autocompletion & Snippets ---------------------- {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" }}}

" Testing shortcuts ---------------------- {{{
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>A :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>
let test#javascript#jasmine#executable = 'node_modules/.bin/babel-node node_modules/.bin/jasmine'
" For testing es6
function! NpmTest(cmd)
  execute "!npm test"
  " execute "!./node_modules/.bin/mocha --compilers js:babel-core/register"
endfunction

let g:test#custom_strategies = {'npmTest': function('NpmTest')}
let g:test#strategy = 'npmTest'
" }}}

" Buffer navigation ---------------------- {{{
" remap buffer navigation per tip #35 of Practical Vim.
" (:bprevious & :bnext use custom mappings, though)
nnoremap <silent> P :bprevious<CR>
nnoremap <silent> N :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" close current buffer
nnoremap Q :bd<CR>
" }}}

" Ctrl-P ---------------------- {{{
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 40
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_new_file = 'v'
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPBufTag<CR>
" }}}

" The Silver Searcher ---------------------- {{{
" https://robots.thoughtbot.com/faster-grepping-in-vim
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
" }}}

" Fold settings ---------------------- {{{
set foldmethod=expr
set foldlevelstart=0
nnoremap <Space> za
" }}}

" Comment settings ---------------------- {{{
let NERDSpaceDelims=1
" }}}

" Abbreviations ---------------------- {{{
iabbrev @@ chip@chipcastle.com
iabbrev wweb http://chipcastle.com
iabbrev ssig --<cr>Chip Castle<cr>chip@chipcastle.com
iabbrev ccopy Copyright 2017 Chip Castle Dot Com, Inc., All rights reserved. 
" }}}
