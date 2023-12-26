local M = {}

local function get_lsp_info()
  local client_names = {}
  local message = ''

  local lsp_list = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })

  if #lsp_list == 0 then
    return message
  end

  -- TODO: add spinner animation for the status
  -- print(vim.inspect(vim.lsp.status()))

  for _, client in ipairs(lsp_list) do
    -- if client.name ~= 'null-ls' then
    table.insert(client_names, client.name)
    -- end
  end

  message = '[' .. table.concat(client_names, ', ') .. ']'
  return message
end

M.opts = {
  options = {
    icons_enabled = true,
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = { 'branch' },
    lualine_b = { 'diff', 'diagnostics' },
    lualine_c = {
      { 'filetype', icon_only = true },
      'filename',
    },
    lualine_x = { get_lsp_info },
  },
  extensions = { 'fugitive' },
}

return M
