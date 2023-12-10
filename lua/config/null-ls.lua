local M = {}

M.config = function()
  local null_ls = require('null-ls')
  null_ls.setup({
    sources = {
      -- Lua
      null_ls.builtins.formatting.stylua,
      -- Golang
      null_ls.builtins.formatting.gofumpt.with({
        extra_args = { '-extra' },
      }),
      null_ls.builtins.formatting.goimports_reviser,
      null_ls.builtins.formatting.golines,
    },
  })
end

return M
