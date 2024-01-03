local M = {}

M.config = function()
  local null_ls = require('null-ls')
  local formatting = null_ls.builtins.formatting
  null_ls.setup({
    sources = {
      -- JS/TS Prettier
      formatting.prettierd.with({ extra_filetypes = { "svelte" } }),
      -- Lua
      formatting.stylua,
      -- Golang
      formatting.gofumpt.with({
        extra_args = { '-extra' },
      }),
      formatting.goimports_reviser,
      formatting.golines,
    },
  })
end

return M
