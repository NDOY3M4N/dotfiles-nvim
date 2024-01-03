return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    -- priority = 1000,
    config = require('config.catppuccin').config,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = { disable_italics = true },
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = require('config.lualine').opts,
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
}
