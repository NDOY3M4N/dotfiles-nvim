---@type LazySpec
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({})

    local nmap = function(keys, func, desc)
      if desc then
        desc = 'Harpoon: ' .. desc
      end

      vim.keymap.set('n', keys, func, { desc = desc })
    end

    nmap('<leader>ma', function() harpoon:list():append() end, "Append")
    nmap('<leader>mm', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Toggle menu")

    nmap('<A-p>', function() harpoon:list():prev() end, "select previous item")
    nmap('<A-n>', function() harpoon:list():next() end, "select next item")
    nmap('<A-h>', function() harpoon:list():select(1) end, "select item #1")
    nmap('<A-j>', function() harpoon:list():select(2) end, "select item #2")
    nmap('<A-k>', function() harpoon:list():select(3) end, "select item #3")
    nmap('<A-l>', function() harpoon:list():select(4) end, "select item #4")
  end,
}
