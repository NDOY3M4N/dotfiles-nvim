local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup('P4P1' .. name, { clear = true })
end

-- dont list quickfix buffers
autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = augroup('YankHighlight'),
  pattern = '*',
})

-- Close some filetypes with <q>
autocmd('Filetype', {
  group = augroup('close_with_q'),
  -- NOTE:`:set ft?` to get the filetype of the current buffer
  pattern = {
    'PlenaryTestPopup',
    'fugitive',
    'help',
    'lspinfo',
    'man',
    'checkhealth',
    'netrw',
    'qf',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<CMD>close<CR>', { buffer = event.buffer, silent = true })
  end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('Filetype', {
  group = augroup('wrap_spell'),
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Change NeogitCommitMessage
vim.api.nvim_create_autocmd('Filetype', {
  group = augroup('change_neogit_commit_message'),
  pattern = { 'NeogitCommitMessage' },
  command = 'silent! set filetype=gitcommit',
})
