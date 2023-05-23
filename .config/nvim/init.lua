local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" }, -- autocompletion with nvim-cmp
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-vsnip" }, -- For vsnip users.
  { "hrsh7th/vim-vsnip" },
  { "williamboman/mason.nvim" },
  { "nvim-lua/plenary.nvim" }, -- For navigating files with nvim-telescope
  { "nvim-telescope/telescope.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Optional plugins for nvim-telescope
  { "kyazdani42/nvim-web-devicons" }, -- If you want to have icons in your statusline choose one of these
  { "onsails/lspkind-nvim" },
  { "numToStr/Comment.nvim" }, -- For code comments
  { "bhurlow/vim-parinfer" }, -- Parenthesis mgt for Clojure and other LISP"s
  { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
  { "ryanoasis/vim-devicons" }, -- Add icons to start screen
  { "nvim-lualine/lualine.nvim" }, -- Add status bar
  { "andrejlevkovitch/vim-lua-format" }, -- automatically format lua code
  { "lewis6991/impatient.nvim" },
  { "ckipp01/stylua-nvim" },
  { "fatih/vim-go" },
  { "hkupty/iron.nvim" },
  { "dstein64/vim-startuptime" },
  -- { "Olical/conjure" },
})
require "chip.options"
require "chip.mappings"
-- require "chip.plugins"
-- require "chip.impatient"
require "chip.treesitter"
require "chip.comments"
require "chip.autocomplete"
require "chip.lsp"
require "chip.telescope"
require "chip.lualine"
require "chip.colorscheme"
require "chip.lsp_lines"
-- require "chip.conjure"
-- require "chip.iron"
