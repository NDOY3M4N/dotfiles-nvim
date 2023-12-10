return {
  -- NOTE: opts = {} is equivalent to require(...).setup()
  { 'folke/which-key.nvim',  opts = {} },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- Git related plugins
  'tpope/vim-rhubarb', -- TODO: Do I need this one?
  {
    'tpope/vim-fugitive',
    keys = require("config.fugitive").keys,
  },
  -- Manipulate brackets with ease
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = require("config.gitsigns").opts,
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = require("config.telescope").dependencies,
    init = require("config.telescope").keys,
    config = require("config.telescope").config,
    opts = require("config.telescope").opts
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
    config = vim.defer_fn(function()
      local opts = require("config.treesitter").opts
      require('nvim-treesitter.configs').setup(opts)
    end, 0)
  },
}
