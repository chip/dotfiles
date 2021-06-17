" Set working directory. Is there an NVIM_HOME?
let $CHIPS_NVIM_HOME='/Users/chip/code/lsp-config'

set rtp=$CHIPS_NVIM_HOME/.config/nvim
set rtp+=/Users/chip/code/nvim-osx64/share/nvim/runtime
set rtp+=/Users/chip/code/nvim-osx64/lib/nvim
set rtp+=$CHIPS_NVIM_HOME/.local/share/nvim/site
set rtp+=$CHIPS_NVIM_HOME/.local/share/nvim/plugged
let &packpath = &rtp

let mapleader=","
colorscheme simple-dark

" Load all the plugins
source $CHIPS_NVIM_HOME/.config/nvim/plugins.vim
" Setup language servers
source $CHIPS_NVIM_HOME/.config/nvim/lsp.vim
" Load auto-completion configuration
source $CHIPS_NVIM_HOME/.config/nvim/autocomplete.vim
" Load fuzzy-finder configuration
source $CHIPS_NVIM_HOME/.config/nvim/telescope.vim
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
source $CHIPS_NVIM_HOME/.config/nvim/.vimrc
