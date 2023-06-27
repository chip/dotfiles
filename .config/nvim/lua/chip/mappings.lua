local utils = require("chip.utils")

vim.g.mapleader = ' ' -- change the <leader> key to be comma

utils.map('n', '-', ':e.<CR>')
utils.map('n', '<leader><leader>', ':e #<CR>')
utils.map('n', '<leader>q', ':bd!<CR>')
utils.map('n', '<leader>w', ':w<CR>')
utils.map('n', '<leader>/', ':noh<CR>')
utils.map('i', 'jk', '<esc>')
utils.map('n', '<leader>bd', ':up | %bd | e#<CR>')
utils.map('n', '<leader>tt', ':new term://npm run test<CR>')
utils.map('n', '<leader>t', '<Plug>PlenaryTestFile', {noremap = false})
