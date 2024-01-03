---@type LazySpec
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin' },
  config = function()
    local palette = require('catppuccin.palettes').get_palette('mocha')

    require('lualine').setup({
      options = {
        icons_enabled = true,
        component_separators = '',
        section_separators = '',
        globalstatus = true,
      },
      sections = {
        lualine_c = {
          {
            'filetype',
            colored = false,
            icon_only = true,
            padding = { left = 1, right = 0 },
            color = { bg = palette.mantle, fg = palette.text },
          },
          { 'filename', color = { bg = palette.mantle, fg = palette.text } },
        },
        -- TODO: show the LSP server
        lualine_x = {},
      },
      extensions = { 'fugitive', 'lazy' },
    })
  end,
}
