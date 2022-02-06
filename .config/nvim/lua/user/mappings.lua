local utils = require("user.utils")

vim.g.mapleader = ',' -- change the <leader> key to be comma

utils.map('n', '<leader>tt', ':new term://npm run test<CR>')
utils.map('n', '-', ':e.<CR>')
utils.map('n', '<leader>q', ':bd!<CR>')
utils.map('n', '<leader>w', ':w<CR>')
utils.map('n', '<leader>R', ':Nredir <c-f>A')
utils.map('n', '<leader>s', ':Startify<CR>')
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

-- vim.g.vimspector_enable_mappings = 'HUMAN'
-- mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
-- for normal mode - the word under the cursor

-- utils.map('n', '<leader>dl', '<Plug>VimspectorLaunch')
-- utils.map('n', '<leader>dc', '<Plug>VimspectorContinue')
-- utils.map('n', '<leader>dq', '<Plug>VimspectorStop')
-- utils.map('n', '<leader>dr', '<Plug>VimspectorRestart')
-- utils.map('n', '<leader>db', '<Plug>VimspectorToggleBreakpoint')
-- utils.map('n', '<leader>de', '<Plug>VimspectorBalloonEval')
-- utils.map('n', '<leader>dr', '<Plug>VimspectorRunToCursor')
-- utils.map('n', '<leader>do', '<Plug>VimspectorStepOver')
-- utils.map('n', '<leader>di', '<Plug>VimspectorStepInto')
-- for visual mode, the visually selected text
-- utils.map('x', '<leader>de', '<Plug>VimspectorBalloonEval')
-- utils.map('n', '<localleader><F11>', '<Plug>VimspectorUpFrame')
-- utils.map('n', '<localleader><F12>', '<Plug>VimspectorDownFrame')
