local M = {}

local spinner_frames = { '', '󰪞', '󰪟', '󰪠', '󰪢', '󰪣', '󰪤', '󰪥' }

-- local spinner_frames = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
local spinner_index = 1
local spinner_timer = vim.loop.new_timer()
spinner_timer:start(
  0,
  100,
  vim.schedule_wrap(function()
    vim.api.nvim_buf_set_var(0, 'spinner', spinner_frames[spinner_index])
    spinner_index = spinner_index % #spinner_frames + 1
    -- print(spinner_frames[spinner_index])
  end)
)

local function get_lsp_info()
  local client_names = {}
  local name = ''

  local lsp_list = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })

  if #lsp_list == 0 then
    return name
  end

  for _, client in ipairs(lsp_list) do
    if client.name ~= 'null-ls' then
      table.insert(client_names, client.name)
    end

    -- for val in client.progress do
    -- NOTE: kind -> begin - start spinner
    -- NOTE: kind -> end - stop spinner
    -- print(vim.inspect(val.value))
    -- print(vim.inspect(val.value.title))
    -- print(vim.inspect(val.value.kind))
    -- end
  end

  name = '[' .. table.concat(client_names, ', ') .. ']'
  return name
end

M.opts = {
  options = {
    icons_enabled = true,
    component_separators = '',
    section_separators = '',
  },
  -- TODO: make the statusline nicer
  sections = {
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      { 'filetype', colored = false, icon_only = true, color = { bg = '#11111B', fg = 'white' } },
      { 'filename', color = { bg = '#11111B' } },
    },
    lualine_x = { get_lsp_info },
  },
  extensions = { 'fugitive' },
}

return M
