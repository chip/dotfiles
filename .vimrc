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
set rtp+=/usr/local/opt/fzf

" only if there are at least 2 windows
set laststatus=2

" set status line
set statusline=%.50F      " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines

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

" numbertoggle
let g:NumberToggleTrigger="<F2>"
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
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript setlocal foldmethod=indent
augroup END

augroup set_jsx
    autocmd!
    autocmd BufRead,BufNewFile *.jsx set filetype=javascript
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript setlocal foldmethod=indent
    " https://github.com/mattn/emmet-vim
    " Trigger with <C-y>,
    " let g:user_emmet_leader_key='<C-Y>'
    let g:user_emmet_settings = { 'javascript.jsx' : { 'extends' : 'jsx' } }
augroup END

augroup set_vue
    autocmd!
    autocmd BufRead,BufNewFile *.vue set filetype=vue
    autocmd FileType vue set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType vue syntax sync fromstart
    autocmd FileType vue setlocal foldmethod=indent
    let g:user_emmet_settings = { 'javascript.vue' : { 'extends' : 'vue' } }
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
    autocmd FileType ruby let g:test#strategy = 'basic'
    autocmd FileType ruby setlocal foldmethod=syntax
augroup END
" }}}

" Autocompletion & Snippets ---------------------- {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
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

" fzf key mappings
" search files in git repo
noremap <leader>f :GFiles<CR>
" search all files
noremap <leader>fa :Files<CR>
" search buffers
noremap <leader>b :Buffers<CR>

" bind K to grep word under cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

if executable('ack')
  set grepprg=ack\ -s\ -H\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" map for running Ack plugin
cnoreabbrev Ack Ack!
nnoremap <leader>a :Ack!<SPACE>
" }}}

" Fold settings ---------------------- {{{
set foldmethod=expr
set foldlevelstart=99
nnoremap <Space> za
" }}}

" Comment settings ---------------------- {{{
let NERDSpaceDelims=1
" }}}

" Abbreviations ---------------------- {{{
iabbrev @@ chip@chipcastle.com
iabbrev wweb http://chipcastle.com
iabbrev ssig --<cr>Chip Castle<cr>chip@chipcastle.com
iabbrev ccopy Copyright 2018 Chip Castle Dot Com, Inc., All rights reserved.
" }}}

" Linting ---------------------------- {{{
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)
" }}}
