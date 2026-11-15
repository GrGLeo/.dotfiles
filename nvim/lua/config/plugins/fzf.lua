local fzf = require('fzf-lua')

fzf.setup({})

vim.keymap.set('n', '<leader>pf', fzf.files)
vim.keymap.set('n', '<leader>pb', fzf.buffers)
vim.keymap.set('n', '<leader>pg', fzf.live_grep)
vim.keymap.set('n', '<leader>en', function()
  fzf.files({
    cwd = vim.fn.stdpath('config'),
    winopts = { height = 0.4, width = 0.9, row = 1 },
  })
end)