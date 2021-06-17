set rtp=~/.config/nvim
" set rtp+=/Users/chip/code/nvim-osx64/share/nvim/runtime
" set rtp+=/Users/chip/code/nvim-osx64/lib/nvim
set rtp+=~/.local/share/nvim/site
set rtp+=~/.local/share/nvim/plugged
let &packpath = &rtp

let mapleader=","
colorscheme simple-dark

" Load all the plugins
source ~/.config/nvim/plugins.vim
" Setup language servers
source ~/.config/nvim/lsp.vim
" Load auto-completion configuration
source ~/.config/nvim/autocomplete.vim
" Load fuzzy-finder configuration
source ~/.config/nvim/telescope.vim
lua << EOF
-- Lua
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
EOF
" Load vim configuration
source ~/.config/nvim/.vimrc
