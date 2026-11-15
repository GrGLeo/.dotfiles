vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('config.pack')

require('config.plugins.colorscheme')
require('config.plugins.treesitter')
require('config.plugins.fzf')
require('config.plugins.completion')
require('config.plugins.harpoon')
require('config.plugins.mini')
require('config.plugins.markdown')
require('config.plugins.lsp')
require('comment')

vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set('n', '<space><space>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<space>x', ':.lua<CR>')
vim.keymap.set('v', '<space>x', ':.lua<CR>')
vim.keymap.set('n', '<space>pv', ':Ex<CR>')
vim.keymap.set('n', '<leader>u', '<cmd>Undotree<CR>')

vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
