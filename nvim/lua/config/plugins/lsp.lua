require('lazydev').setup({
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
})

vim.lsp.enable({ 'lua_ls', 'gopls', 'pyrefly', 'rust_analyzer' })

vim.keymap.set('n', '<leader>gf', function()
  vim.lsp.buf.format()
end)
vim.keymap.set('n', '<leader>rn', function()
  vim.lsp.buf.rename()
end)
vim.keymap.set('n', '<leader>gd', function()
  vim.lsp.buf.definition()
end)

vim.diagnostic.config({
  virtual_text = false,
})

vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
