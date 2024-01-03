---@type LazySpec
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({})

    vim.keymap.set('n', '<leader>ma', function()
      harpoon:list():append()
    end)
    vim.keymap.set('n', '<leader>mm', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<A-h>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<A-j>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<A-k>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<A-l>', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<A-p>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<A-n>', function()
      harpoon:list():next()
    end)
  end,
}
