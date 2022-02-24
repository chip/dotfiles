-- Find files using Telescope command-line sugar.
local utils = require("chip.utils")
utils.map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
utils.map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
utils.map('n', '<leader>fs', '<cmd>Telescope grep_string<cr>')
utils.map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
utils.map('n', '<leader>fi', '<cmd>Telescope file_browser<cr>')

require('telescope').load_extension('telescope-code-fence')
vim.cmd('nnoremap <leader>cf <cmd>Telescope telescope-code-fence find')
