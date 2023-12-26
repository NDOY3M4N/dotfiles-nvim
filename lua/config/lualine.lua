local M = {}

M.opts = {
  options = {
    icons_enabled = false,
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    -- TODO: LSP server name here
    lualine_a = { 'encoding' },
    lualine_x = { 'filetype' },
  },
  extensions = { 'fugitive' },
}

return M
