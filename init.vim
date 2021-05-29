set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" Load all the plugins
source ~/.config/nvim/plugins.vim
source ~/.vimrc
