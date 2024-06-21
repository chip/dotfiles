return {
	-- add Spacegray
	-- { "vim-scripts/Spacegray.vim" },
	-- { "rebelot/kanagawa.nvim" },
	-- 	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- 	{
	-- 		"LazyVim/LazyVim",
	-- 		opts = {
	-- 			-- colorscheme = "catppuccin-latte",
	-- 			colorscheme = "catppuccin-frappe",
	-- 			-- colorscheme = "catppuccin-macchiator",
	-- 			-- colorscheme = "catppuccin-mocha",
	-- 		},
	-- 	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_enable_italic = true
			vim.cmd.colorscheme("everforest")
		end,
	},
}
