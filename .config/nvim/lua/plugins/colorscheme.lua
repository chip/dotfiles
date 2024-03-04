return {
	-- add gruvbox
	{ "vim-scripts/Spacegray.vim" },

	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "Spacegray",
		},
	},
}
