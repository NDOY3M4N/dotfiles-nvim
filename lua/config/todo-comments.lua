local M = {}

M.keys = {
  {
    'n',
    ']t',
    function()
      require('todo-comments').jump_next()
    end,
    desc = 'Next todo comment',
  },
  {
    'n',
    '[t',
    function()
      require('todo-comments').jump_prev()
    end,
    desc = 'Previous todo comment',
  },
  { '<leader>sT', '<cmd>TodoTelescope<cr>',                        desc = 'Todo' },
  { '<leader>st', '<cmd>TodoTelescope keywords=TODO,FIX,PERF<cr>', desc = 'Todo/Fix/Perf' },
}

return M
