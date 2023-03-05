----------- TELESCOPE ----------
require('telescope').setup({
  -- defaults = {
  --   generic_sorter = require('mini.fuzzy').get_telescope_sorter
  -- }
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- vim.keymap.set('n', '<leader>fi', builtin.file_browser, {})
