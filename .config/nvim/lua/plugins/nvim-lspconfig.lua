vim.opt.signcolumn = "yes"

return {
  "neovim/nvim-lspconfig",
  opts = {
    ruby_ls = {
      autostart = true,
      cmd = { "chruby (cat .ruby-version) && ~/.local/share/nvim/mason/packages/ruby-lsp/bin/ruby-lsp" },
      init_options = {
        formatter = "auto",
      },
      settings = {},
    },
    rubocop = {
      enabled = false,
    },
  },
}
