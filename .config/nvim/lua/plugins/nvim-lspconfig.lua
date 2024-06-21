local lspconfig = require("lspconfig")

vim.opt.signcolumn = "yes"
vim.api.nvim_create_autocmd("FileType", {
	pattern = "ruby",
	callback = function()
		vim.lsp.start({
			autostart = true,
			name = "rubocop",
			cmd = { "bundle", "exec", "rubocop", "--lsp" },
		})
	end,
})

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
	},
}
