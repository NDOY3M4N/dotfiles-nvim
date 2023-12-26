return {
  -- NOTE: opts = {} is equivalent to require(...).setup()
  { 'folke/which-key.nvim', opts = {} },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth', -- TODO: Do I need this one?
  -- Git related plugins
  'tpope/vim-rhubarb', -- TODO: Do I need this one?
  {
    'tpope/vim-fugitive',
    keys = require('config.fugitive').keys,
  },
  -- Harpoon2
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = require('config.harpoon').config,
  },
  -- Manipulate brackets with ease
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    opts = {},
  },
  -- autopairing of (){}[] etc
  {
    'windwp/nvim-autopairs',
    opts = require('config.nvim-autopairs').opts,
    config = require('config.nvim-autopairs').config,
  },
  -- TODO comments
  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTelescope' },
    event = { 'BufReadPost', 'BufNewFile' },
    opts = require('config.todo-comments').opts,
    keys = require('config.todo-comments').keys,
  },

  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = require('config.gitsigns').opts,
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
    },
    init = require('config.telescope').init,
    config = require('config.telescope').config,
    opts = require('config.telescope').opts,
  },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
    config = vim.defer_fn(function()
      local opts = require('config.treesitter').opts
      require('nvim-treesitter.configs').setup(opts)
    end, 0),
  },
}
