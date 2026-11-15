require('nvim-treesitter').install({
  'rust',
  'lua',
  'go',
  'vim',
  'vimdoc',
  'query',
  'markdown',
  'markdown_inline',
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
    if ok and stats and stats.size > max_filesize then
      return
    end

    pcall(vim.treesitter.start)
  end,
})
