local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- autocompletion with nvim-cmp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- For vsnip users.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'kabouzeid/nvim-lspinstall'
  -- For navigating files with nvim-telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  -- Optional plugins for nvim-telescope
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  -- If you want to have icons in your statusline choose one of these
  use 'kyazdani42/nvim-web-devicons'
  use 'onsails/lspkind-nvim'
  -- For code comments
  use 'numToStr/Comment.nvim'
  -- Colorscheme
  use 'srcery-colors/srcery-vim'
  -- REPL for Clojure and other LISP's
  use {'Olical/conjure', tag = 'v4.21.0'}
  use 'tpope/vim-dispatch'
  use 'clojure-vim/vim-jack-in'
  use 'radenling/vim-dispatch-neovim'
  -- Parenthesis mgt for Clojure and other LISP's
  use 'bhurlow/vim-parinfer'
  -- VS Code snippets for Clojure
  use 'Leocardoso94/clojure-snippets'
  -- Fancy start screen
  use 'mhinz/vim-startify'
  -- Add icons to start screen
  use 'ryanoasis/vim-devicons'
  -- Add status bar
  use 'nvim-lualine/lualine.nvim'
  -- Lua REPL
  -- Plug 'bfredl/nvim-luadev'
  use 'rafcamlet/nvim-luapad'
  -- Redirect the output of a Vim or external command into a scratch buffer, in LUA
  use 'sbulav/nredir.nvim'
  -- automatically format lua code
  use 'andrejlevkovitch/vim-lua-format'
  use 'williamboman/nvim-lsp-installer'
  use 'puremourning/vimspector'
  use 'szw/vim-maximizer'

  -- Plug 'nvim-lua/plenary.nvim'
  -- Plug 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-github.nvim'
  use {
    'thibthib18/mongo-nvim',
    rocks = {'lua-mongo'},
    config = function()
      require'mongo-nvim'.setup({
        -- connection string to your mongodb
        connection_string = "mongodb://127.0.0.1:27017",
        -- key to use for previewing/picking documents
        list_document_key = "name"
      })
    end
  }
  -- EXPERIMENTAL FOR LUA DEVELOPMENT
  --
  -- Plug 'tjdevries/nlua.nvim'
  -- " (OPTIONAL): If you want to use built-in LSP (requires Neovim HEAD)
  -- "   Currently only supported LSP, but others could work in future if people send PRs :)
  -- " Plug 'neovim/nvim-lspconfig'
  -- " (OPTIONAL): This is recommended to get better auto-completion UX experience for builtin LSP.
  -- Plug 'nvim-lua/completion-nvim'
  -- " (OPTIONAL): This is a suggested plugin to get better Lua syntax highlighting
  -- "   but it's not currently required
  -- Plug 'euclidianAce/BetterLua.vim'
  -- " (OPTIONAL): If you wish to have fancy lua folds, you can check this out.
  -- Plug 'tjdevries/manillua.nvim'
  --
  -- END EXPERIMENTAL

  -- NVIM plugin in Lua
  -- use '~/code-slurp.nvim'
  -- require("code-slurp").setup()

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then require('packer').sync() end
end)
