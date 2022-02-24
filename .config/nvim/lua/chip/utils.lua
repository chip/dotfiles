local M = {}

-- need a map method to handle the different kinds of key maps
function M.map(mode, combo, mapping, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

return M

-- function _G.put(...)
--   local objects = {}
--   for i = 1, select('#', ...) do
--     local v = select(i, ...)
--     table.insert(objects, vim.inspect(v))
--   end
--
--   print(table.concat(objects, '\n'))
--   return ...
-- end
