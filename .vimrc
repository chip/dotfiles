" Not compatible with vi ---------------------- {{{
" choose no compatibility with legacy vi
set nocompatible
" }}}

" Plugins ---------------------- {{{
" Use 'pack' command to manage plugins
" }}}

" Basic settings ---------------------- {{{
set encoding=utf-8
set fileformat=unix
syntax enable
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

" https://github.com/itchyny/lightline.vim
set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'wombat' }

" enable per-directory .vimrc files
set exrc

" disable unsafe commands in local .vimrc files
set secure

" file suffixes to search when using gf to find a file
set suffixesadd+=.js,.rb
" }}}

" Colors ---------------------- {{{
set background=dark
colorscheme hybrid_material
" }}}

" Snippets & Autocompletion ---------------------- {{{
let g:UltiSnipsExpandTrigger = "<c-k>"        " Do not use <tab>

" autocompletion should use keywords from dictionary
set complete+=k

set completeopt+=menuone
set completeopt+=noselect
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['path', 'ulti', 'keyn']
" }}}

" Mappings  ---------------------- {{{
" map the leader key to a comma instead of a backslash
let mapleader=","

" go back to the previous buffer
nnoremap <leader><leader> <c-^>

" Per https://github.com/mhartington/dotfiles/blob/master/config/nvim/init.vim
nnoremap ; :

" shortcut for saving a file
noremap <leader>w :w<CR>

" shortcut for quitting a file
noremap <leader>q :q<CR>

" shortcut for saving and quitting a file
noremap <leader>x :wq<CR>

" remapping escape
inoremap jk <esc>
inoremap <esc> <nop>

" remove search highlighting ---------------------- {{{
nnoremap <esc> :noh<CR>
" }}}

" edit .vimrc
nnoremap <leader>v :e $MYVIMRC<cr>

" save .vimrc and source it
nnoremap <leader>sv :w\|:source $MYVIMRC<cr>

" edit .zshrc
nnoremap <leader>z :e ~/.zshrc<cr>
" }}}

" fzf key settings ---------------------- {{{
" search files in git repo
noremap <leader>f :GFiles<CR>
" search all files
noremap <leader>i :Files<CR>
" search buffers
noremap <leader>b :Buffers<CR>
" }}}

" signify settings ---------------------- {{{
let g:signify_vcs_list = ['git']
highlight DiffAdd           cterm=none ctermbg=none ctermfg=119
highlight DiffDelete        cterm=none ctermbg=none ctermfg=167
highlight DiffChange        cterm=none ctermbg=none ctermfg=227
" }}}

" numbertoggle settings ---------------------- {{{
let g:NumberToggleTrigger="<F2>"
" }}}

" spell check ---------------------- {{{
setlocal spell spelllang=en_us

nnoremap <leader>sp :set spell<cr>
nnoremap <leader>nsp :set nospell<cr>

function! SpellHighlight(source)
  " echo "SpellHighlight " . a:source
  " See xterm colors: https://jonasjacek.github.io/colors/
  highlight SpellBad   cterm=none ctermfg=210 ctermbg=none
  highlight SpellCap   cterm=none ctermfg=210 ctermbg=none
  highlight SpellRare  cterm=none ctermfg=210 ctermbg=none
  highlight SpellLocal cterm=none ctermfg=210 ctermbg=none
endfunction
" }}}

" FileType settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim :call SpellHighlight("filetype_vim")
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
    autocmd FileType javascript :call SpellHighlight("filetype_javascript")
augroup END

augroup set_jsx
    autocmd!
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
    autocmd FileType ruby let g:test#strategy = 'basic'
    autocmd FileType ruby setlocal foldmethod=syntax
    let g:syntastic_ruby_checkers = []
augroup END
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
  " execute "!./node_modules/.bin/mocha --compilers js:babel-core/register --inline-diffs"
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

" bind K to grep word under cursor ---------------------- {{{
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>
" }}}

" ack configuration ---------------------- {{{
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

" Linting ---------------------------- {{{
let g:ale_linters = {'javascript': ['eslint'], 'ruby': []}
let g:ale_fixers = {'javascript': ['eslint'], 'ruby': []}
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_delay = 20000
let g:ale_fix_on_save = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'

nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)
" }}}
