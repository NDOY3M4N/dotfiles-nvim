---@type LazySpec
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        no_italic = true,
      })

      vim.cmd.colorscheme('catppuccin')
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = { disable_italics = true },
  },
}
