local M = {}

M.config = function()
  require('catppuccin').setup({
    no_italic = true,
  })

  vim.cmd.colorscheme('catppuccin')
end

return M