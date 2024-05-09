---@type LazySpec
return {
  {
    'tpope/vim-fugitive',
    enabled = false,
    keys = {
      { '<leader>gg', '<cmd> Git<cr>', desc = 'Open fugitive' },
    },
  },
  {
    'NeogitOrg/neogit',
    dependencies = { 'sindrets/diffview.nvim' },
    config = true,
    keys = {
      { '<leader>gg', '<cmd> Neogit<cr>', desc = 'Open Neogit' },
    },
  },
}
