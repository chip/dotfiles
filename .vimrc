" Configuration inspired by http://mislav.uniqpath.com/2011/12/vim-revisited/
set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set fileformat=unix
call pathogen#infect()

syntax enable
filetype plugin indent on       " load file type plugins + indentation

setlocal spell spelllang=en_us 

"" Whitespace
set wrap
set linebreak
" note trailing space at end of next line
set showbreak=>\ \ \
set expandtab                   " use spaces, not tabs (optional)
"set smarttab
set shiftwidth=2      " a tab is two spaces (or set this to 4)
set softtabstop=2      " a tab is two spaces (or set this to 4)
set autoindent
set smartindent
"set cindent
"set list                        " Show invisible characters
set backspace=indent,eol,start  " backspace through everything in insert mode
autocmd FileType ruby,coffee,js,less,c,php autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufWritePre *.cgi,*.pl,*.html :%s/\s\+$//e
set tw=72
set fo+=1

"" Searching
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set hlsearch                    " highlight matches
:nmap \q :nohlsearch<CR>
set number      " show line numbers
set ruler       " show the cursor position all the time
set cursorline  " highlight the line of the cursor
set showcmd     " display incomplete commands
set shell=/usr/local/bin/zsh
let g:is_bash=1 " default shell syntax
set history=200 " remember more Ex commands
set scrolloff=3 " have some context around the current line always on screen

" Auto-reload buffers when file changed on disk
set autoread

set nobackup
set noswapfile
set clipboard=unnamed

let mapleader=","

autocmd FileType make setlocal noexpandtab
map <leader>gg :topleft 100 :split Gemfile<cr>

nnoremap <leader><leader> <c-^>

map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>x :wq<CR>

" Terminal Profile: http://noahfrederick.com/blog/2012/hemisu-for-lion-terminal/
" Font: Monaco 14 pt.
" Advanced: xterm-16color
" http://blog.remibergsma.com/2012/03/15/tweak-the-osx-terminal-to-display-colors/
" Color scheme: http://ethanschoonover.com/solarized
set background=dark
colorscheme railscasts

" Remapping escape
inoremap jk <esc>
inoremap <esc> <nop>

" .vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :w\|:source $MYVIMRC<cr>
nnoremap <leader>zsh :e ~/.zshrc<cr>
nnoremap <leader>th :e ~/.oh-my-zsh/themes/chip.zsh-theme<cr>

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Always display the statusline in all windows
set laststatus=2
" Always display the tabline, even if there is only one tab
set showtabline=2

map <leader>j :call JumpBetweenSpecAndCode()<cr>

function! JumpBetweenSpecAndCode()
  let filename = expand("%:t")
  if filename =~ '_spec\.'
  let filename = substitute(filename, '_spec', '', '')
  let foundfile = findfile(filename, ";,**")
  exec "edit " . foundfile
  else
  let filename = substitute(filename, '\.', '_spec\.', '')
  let foundfile = findfile(filename, ";,**")
  exec "edit " . foundfile
  endif
endfunction

" janko-m/vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "basic"

" Ctrl-P mapping is overwritten
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 40
let g:ctrlp_custom_ignore = 'tmp\|log\|public\|vendor/assets\|vendor/bundle\|vendor/plugins\|spec/cassett\|\.git\|cassett\|/.git\|/app/assets/image\|/coverage\|public/*\.js\|node_modules'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPBufTag<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <leader>a :Ag<SPACE>

" folding
set foldmethod=manual
nnoremap <Space> za

" http://stackoverflow.com/questions/10964681/enabling-markdown-highlighting-in-vim
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.jsx set filetype=javascript
au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile *.css set filetype=css
au BufRead,BufNewFile *.less set filetype=css

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

let syntastic_mode_map = { 'passive_filetypes': ['html'] }
let g:syntastic_javascript_checkers = ['jsxhint']

" Bootstrap autocomplete
set dictionary+=~/.vim/bundle/bootstrap-snippets/dictionary
set complete+=k

set exrc " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files

" TMUX Configuration
" http://tangosource.com/blog/a-tmux-crash-course-tips-and-tweaks/
if exists('$TMUX')
  set term=screen-256color
endif

if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

" for tmux to automatically set paste and nopaste mode at the time pasting (as
" happens in VIM UI)

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

call plug#begin('~/.vim/plugged')

Plug 'ggreer/the_silver_searcher'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'
Plug 'Shougo/neocomplete.vim'
Plug 'othree/jspc.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Add plugins to &runtimepath
call plug#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" For use with neocomplete
autocmd FileType javascript setlocal omnifunc=jspc#omni
