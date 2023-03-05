require "paq" {
    "savq/paq-nvim", -- Paq manages itself
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp", -- autocompletion with nvim-cmp
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-vsnip", -- For vsnip users.
    "hrsh7th/vim-vsnip",
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim", -- For navigating files with nvim-telescope
    "nvim-telescope/telescope.nvim",
    {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}, -- Optional plugins for nvim-telescope
    "kyazdani42/nvim-web-devicons", -- If you want to have icons in your statusline choose one of these
    "onsails/lspkind-nvim",
    "numToStr/Comment.nvim", -- For code comments
    "bhurlow/vim-parinfer", -- Parenthesis mgt for Clojure and other LISP"s
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    "ryanoasis/vim-devicons", -- Add icons to start screen
    "nvim-lualine/lualine.nvim", -- Add status bar
    "andrejlevkovitch/vim-lua-format", -- automatically format lua code
    "lewis6991/impatient.nvim",
    "ckipp01/stylua-nvim",
    "fatih/vim-go",
    "hkupty/iron.nvim",
}
vim.opt.runtimepath:append("~/code/telescope-code-fence.nvim")
vim.opt.runtimepath:append("~/code/telescope-software-licenses.nvim")
