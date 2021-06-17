set rtp+=~/.config/nvim,~/.local/share/nvim/site,~/.local/share/nvim/plugged
let &packpath = &rtp

let mapleader=","

" Load all the plugins
source ~/.config/nvim/plugins.vim
" Setup language servers
source ~/.config/nvim/lsp.vim
" Load auto-completion configuration
source ~/.config/nvim/autocomplete.vim
" Load fuzzy-finder configuration
source ~/.config/nvim/telescope.vim
" Load vim configuration
source ~/.config/nvim/.vimrc
