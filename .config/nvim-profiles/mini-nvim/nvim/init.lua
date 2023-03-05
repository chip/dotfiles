----------- PACKAGE MANAGER ----------
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

----------- LEADER KEY ----------
-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

----------- COLORSCHEME ----------
vim.cmd('colorscheme spacegray')

----------- PLUGINS ----------
require("lazy").setup({
  { 'echasnovski/mini.nvim', version = false },
  { 'max397574/better-escape.nvim', config = function() require("better_escape").setup() end },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.1', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'onsails/lspkind-nvim' },
  { 'hkupty/iron.nvim' },
  { 'kyazdani42/nvim-web-devicons' },
  { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },
  { 'andrejlevkovitch/vim-lua-format' },
})

----------- PLUGIN CONFIGURATION ----------
require('mini-nvim')
require('telescope-nvim')
require('treesitter')
require('lsp')
require('iron-nvim')

----------- MISCELLANEOUS NVIM OPTIONS ----------
require('options')
