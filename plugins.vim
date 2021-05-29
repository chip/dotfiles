" - stdpath is ~/.local/share/nvim
call plug#begin('~/.local/share/nvim/plugged')
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'jremmen/vim-ripgrep'
Plug 'honza/vim-snippets'
" Initialize plugin system
call plug#end()

