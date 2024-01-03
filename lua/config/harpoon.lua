local M = {}

M.config = function()
  local harpoon = require('harpoon')
  harpoon:setup()

  vim.keymap.set('n', '<leader>mr', function()
    harpoon.list():remove()
  end)

  vim.keymap.set('n', '<leader>ma', function()
    harpoon:list():append()
  end)
  vim.keymap.set('n', '<leader>mm', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)

  vim.keymap.set('n', '<leader>mp', function()
    harpoon:list():prev()
  end)
  vim.keymap.set('n', '<leader>mn', function()
    harpoon:list():next()
  end)
end

return M
