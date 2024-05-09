---@type LazySpec
return {
  'folke/todo-comments.nvim',
  cmd = { 'TodoTelescope' },
  event = { 'BufReadPost', 'BufNewFile' },
  opts = { signs = false },
  keys = {
    {
      ']t',
      function()
        require('todo-comments').jump_next()
      end,
      desc = 'Next todo comment',
    },
    {
      '[t',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = 'Previous todo comment',
    },
    -- { '<leader>sT', '<cmd>TodoTelescope<cr>', desc = 'Todo' },
    { '<leader>st', '<cmd>TodoTelescope keywords=TODO,FIX,PERF<cr>', desc = 'Todo/Fix/Perf' },
  },
}
