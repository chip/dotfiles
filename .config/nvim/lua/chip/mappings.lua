local utils = require("chip.utils")

vim.g.mapleader = ',' -- change the <leader> key to be comma

utils.map('n', '<leader>tt', ':new term://npm run test<CR>')
utils.map('n', '-', ':e.<CR>')
utils.map('n', '<leader><leader>', ':e #<CR>')
utils.map('n', '<leader>q', ':bd!<CR>')
utils.map('n', '<leader>w', ':w<CR>')
utils.map('n', '<leader>R', ':Nredir <c-f>A')
utils.map('n', '<leader>t', '<Plug>PlenaryTestFile', {noremap = false})
utils.map('n', '<leader>/', ':noh<CR>')
utils.map('i', 'jk', '<esc>')

vim.cmd('autocmd FileType lua nnoremap <buffer> <C-K> :call LuaFormat()<cr>')
vim.cmd('autocmd BufWrite *.lua call LuaFormat()')

utils.map('n', '<leader>dbl',
          ":lua require('mongo-nvim.telescope.pickers').database_picker()<cr>")
utils.map('n', '<leader>dbcl',
          ":lua require('mongo-nvim.telescope.pickers').collection_picker()<cr>")
utils.map('n', '<leader>dbdl',
          ":lua require('mongo-nvim.telescope.pickers').document_picker()<cr>")

