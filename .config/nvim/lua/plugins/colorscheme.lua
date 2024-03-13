return {
  -- add Spacegray
  { "vim-scripts/Spacegray.vim" },

  -- Configure LazyVim to load Spacegray
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "Spacegray",
    },
  },
}
