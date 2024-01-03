-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
local keymap = vim.keymap.set

keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Stay in indent mode
keymap('v', '>', '>gv', { desc = 'Stay in indent mode' })
keymap('v', '<', '<gv', { desc = 'Stay in indent mode' })

-- Move lines
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

-- Enter normal mode with jk, kj
keymap('i', 'jk', '<Esc>')
keymap('i', 'kj', '<Esc>')

-- Navigate between buffers
keymap('n', '[b', '<CMD>bprev<CR>', { desc = 'Go to the previous buffer' })
keymap('n', ']b', '<CMD>bnext<CR>', { desc = 'Go to the next buffer' })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Go to beginning and end of a line
keymap('i', '<C-b>', '<Esc>^i', { desc = 'Beginning of line' })
keymap('i', '<C-e>', '<End>', { desc = 'End of line' })

-- Navigate within insert mode
keymap('i', '<C-h>', '<Left>', { desc = 'Move cursor left' })
keymap('i', '<C-l>', '<Right>', { desc = 'Move cursor right' })
keymap('i', '<C-j>', '<Down>', { desc = 'Move cursor down' })
keymap('i', '<C-k>', '<Up>', { desc = 'Move cursor up' })

-- Switch between windows
keymap('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
keymap('n', '<C-i>', '<C-w>k', { desc = 'Window up' })

-- Clear highlights
keymap('n', '<Esc>', '<CMD>noh<CR>', { desc = 'Clear highlights' })

-- Save file
keymap('n', '<C-s>', '<CMD>w<CR>', { desc = 'Save file' })

-- Copy all
keymap('n', '<C-c>', '<CMD>%y+<CR>', { desc = 'Copy whole file' })

-- Terminal stuff
keymap('t', '<C-x>', vim.api.nvim_replace_termcodes('C-\\><C-N>', true, true, true), { desc = 'Escape terminal mode' })

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
