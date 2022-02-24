require "paq" {
  "savq/paq-nvim"; -- Paq manages itself
  "neovim/nvim-lspconfig";
  "hrsh7th/cmp-nvim-lsp"; -- autocompletion with nvim-cmp
  "hrsh7th/cmp-buffer";
  "hrsh7th/cmp-path";
  "hrsh7th/cmp-cmdline";
  "hrsh7th/nvim-cmp";
  "hrsh7th/cmp-vsnip"; -- For vsnip users.
  "hrsh7th/vim-vsnip";
  "kabouzeid/nvim-lspinstall";
  "nvim-lua/plenary.nvim"; -- For navigating files with nvim-telescope
  "nvim-telescope/telescope.nvim";
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}; -- Optional plugins for nvim-telescope
  "kyazdani42/nvim-web-devicons"; -- If you want to have icons in your statusline choose one of these
  "onsails/lspkind-nvim";
  "numToStr/Comment.nvim"; -- For code comments
  "srcery-colors/srcery-vim"; -- Colorscheme
  -- {"Olical/conjure"; tag = "v4.21.0"}; -- REPL for Clojure and other LISP"s
  "Olical/conjure";
  "tpope/vim-dispatch";
  "clojure-vim/vim-jack-in";
  "radenling/vim-dispatch-neovim";
  "bhurlow/vim-parinfer"; -- Parenthesis mgt for Clojure and other LISP"s
  "Leocardoso94/clojure-snippets"; -- VS Code snippets for Clojure
  -- "mhinz/vim-startify"; -- Fancy start screen
  "ryanoasis/vim-devicons"; -- Add icons to start screen
  "nvim-lualine/lualine.nvim"; -- Add status bar
  "rafcamlet/nvim-luapad"; -- Lua REPL
  "sbulav/nredir.nvim"; -- Redirect the output of a Vim or external command into a scratch buffer; in LUA
  "andrejlevkovitch/vim-lua-format"; -- automatically format lua code
  "williamboman/nvim-lsp-installer";
  "szw/vim-maximizer";
  "nvim-telescope/telescope-github.nvim";
  "hkupty/impromptu.nvim";
}
vim.opt.runtimepath:append("~/code/telescope-code-fence.nvim")
