----------- MINI-VIM CONFIG ----------
require('mini.align').setup()
require('mini.basics').setup()
require('mini.bufremove').setup()
require('mini.comment').setup()
require('mini.completion').setup()
require('mini.fuzzy').setup()
require('mini.move').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.trailspace').setup()

-- -- Mini starter
local status, starter = pcall(require, "mini.starter")
if not status then
  return
end

starter.setup({
  content_hooks = {
    starter.gen_hook.adding_bullet(""),
    starter.gen_hook.aligning("center", "center"),
  },
  evaluate_single = true,
  footer = os.date(),
  header = table.concat({
    [[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
    [[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
    [[/ /\  /  __/ (_) \ V /| | | | | | |]],
    [[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
    [[───────────────────────────────────]],
  }, "\n"),
  query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
  items = {
    { action = "enew", name = "New Buffer", section = "Builtin actions" },
    { action = "Lazy", name = "Update Plugins", section = "Plugins" },
    { action = "qall!", name = "Quit Neovim", section = "Builtin actions" },
  },
})

vim.cmd([[
  augroup MiniStarterJK
    au!
    au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
    au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
    au User MiniStarterOpened nmap <buffer> <leader>ff <Cmd>Telescope find_files<CR>
    au User MiniStarterOpened nmap <buffer> <leader>fb <Cmd>Telescope buffers<CR>
    au User MiniStarterOpened nmap <buffer> <leader>fi <Cmd>Telescope file_browser<CR>
    au User MiniStarterOpened nmap <buffer> <leader>fg <Cmd>Telescope live_grep<CR>
    au User MiniStarterOpened nmap <buffer> <leader>fh <Cmd>Telescope help_tags<CR>
  augroup END
]])
require('mini.statusline').setup()
require('mini.test').setup()
