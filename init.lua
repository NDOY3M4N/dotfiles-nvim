-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Useful plugin to show you pending keybinds.
-- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
--       These are some example plugins that I've included in the kickstart repository.
--       Uncomment any of the lines below to enable them.
-- require 'kickstart.plugins.autoformat',
-- require 'kickstart.plugins.debug',

-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
--    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
--    up-to-date with whatever is in the kickstart repo.
--    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
--
--    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
-- { import = 'custom.plugins' },

-- [[ Configure plugins ]]
require('lazy').setup('plugins')

-- [[ Setting options ]]
-- See `:help vim.o`
require('options')

-- [[ Autocommands ]]
require('autocmds')

-- [[ Basic Keymaps ]]
require('keymaps')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
